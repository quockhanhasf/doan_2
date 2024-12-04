class Sanpham < ApplicationRecord
  # Đảm bảo có trường `soluong` là số lượng tồn kho
  validates :soluong, numericality: { greater_than_or_equal_to: 0 }
end
