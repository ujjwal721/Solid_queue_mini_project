class LeaderboardJob < ApplicationJob
  queue_as :default

  def perform(user_id, total_points)
    user = User.find_by(id: user_id)
    unless user
      Rails.logger.error "User with id #{user_id} not found."
      return
    end

    leaderboard_entry = Leaderboard.find_or_initialize_by(user_id: user_id)
    # If this is a new record, assign the user association
    leaderboard_entry.user ||= user

    leaderboard_entry.leaderboard_points = total_points
    leaderboard_entry.save!  # use save! to raise an error if something goes wrong

    puts "Leaderboard Updated: #{user.name} now has #{total_points} points."
  end
end
