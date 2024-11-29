class Donhang < ApplicationRecord
  validates :hoten, :sdt, :xa, :huyen, :tinh, :diachi, :tongthanhtoan, :tranghthaithanhtoan, :tensanpham, :soluong, :ngaydathang, presence: true
end
