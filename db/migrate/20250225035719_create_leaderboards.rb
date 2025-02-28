class CreateLeaderboards < ActiveRecord::Migration[8.0]
  def change
    create_table :leaderboards do |t|
      t.integer :user_id
      t.integer :leaderboard_points

      t.timestamps
    end
  end
end
