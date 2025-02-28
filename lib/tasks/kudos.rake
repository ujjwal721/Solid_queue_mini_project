namespace :kudos do
    desc "Process Kudos table and enqueue valid tuples to Solid Queue"
    task process: :environment do
      ProcessKudosJob.perform_later
    end
  end
  