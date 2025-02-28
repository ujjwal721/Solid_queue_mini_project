class User < ApplicationRecord
    has_many :sent_kudos, class_name: "KudosSent", foreign_key: "sender_id"
    has_many :received_kudos, class_name: "KudosSent", foreign_key: "receiver_id"
    has_one :leaderboard
  end
  