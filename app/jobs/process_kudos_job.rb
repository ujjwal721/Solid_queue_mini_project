class ProcessKudosJob < ApplicationJob
  queue_as :default

  def perform
    KudosSent.where(processed: false).find_each do |kudos|
      # Validate tuple using our custom method.
      unless kudos.valid_tuple?
        puts "Invalid Kudos Tuple: #{kudos.inspect}"
        # Optionally log or mark as processed to avoid reprocessing.
        next
      end

      receiver = User.find_by(id: kudos.receiver_id)
      next unless receiver

      # Update user's points.
      receiver.update(points: receiver.points.to_i + kudos.points)

      # Mark kudos as processed.
      kudos.update(processed: true)
      puts "Processed Kudos: #{receiver.name} received #{kudos.points} points."

      # Enqueue job to update leaderboard.
      LeaderboardJob.perform_later(receiver.id, receiver.points)
    end
  end
end
