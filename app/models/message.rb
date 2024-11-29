class Message < ApplicationRecord
  belongs_to :user, class_name: "Taikhoan", foreign_key: "taikhoan_id"

  validates :content, presence: true
end
