class KudosSent < ApplicationRecord
    belongs_to :sender, class_name: "User"
    belongs_to :receiver, class_name: "User"
  
    # Validate tuple: must have a sender, receiver, non-zero points, and a message.
    def valid_tuple?
      sender.present? && receiver.present? && points.to_i > 0 && message.present?
    end
  end
  