# app/models/donhang.rb
class Donhang < ApplicationRecord
  # Validation cho các trường cần thiết
  validates :hoten, :sdt, :email, :diachi, :tensanpham, :soluong, :trangthaithanhtoan, :tongthanhtoan, :ngaydathang, presence: true
  validates :tongthanhtoan, numericality: { greater_than: 0 }
  validates :soluong, numericality: { only_integer: true, greater_than: 0 }
end
