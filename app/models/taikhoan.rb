class Taikhoan < ApplicationRecord
  before_create :set_default_avatar_url
  has_many :messages, dependent: :destroy # Một tài khoản có nhiều tin nhắn

  private

  def set_default_avatar_url
    self.avatar_url ||= Rails.root.join("app/assets/images/th.jpg").to_s # Đặt đường dẫn mặc định
  end
end
