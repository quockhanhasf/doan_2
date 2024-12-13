class GiaidoanController < ApplicationController
  before_action :authenticate_user!

  def index
    @donhangs = Donhang.all
    # Đếm số lượng đơn hàng (hoặc đếm các điều kiện cụ thể nếu cần)
    @giaohang_count = @donhangs.size
  end




  def show
    @donhangs = Donhang.includes(:sanpham) # Giả sử có quan hệ giữa Donhang và Sanpham
  end
end
