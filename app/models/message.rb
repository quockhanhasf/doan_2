class Message < ApplicationRecord
  belongs_to :sender, class_name: "Taikhoan", foreign_key: "taikhoan_id"
  belongs_to :recipient, class_name: "Taikhoan", foreign_key: "recipient_id"

  scope :between_users, ->(user1, user2) {
    where(taikhoan_id: user1.id, recipient_id: user2.id)
      .or(where(taikhoan_id: user2.id, recipient_id: user1.id))
  }
end
