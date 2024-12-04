# app/controllers/donhangs_controller.rb
class DonhangsController < ApplicationController
  skip_before_action :verify_authenticity_token  # Nếu không sử dụng token CSRF

  def create
    @donhang = Donhang.new(donhang_params)

    if @donhang.save
      # Lấy tên sản phẩm và số lượng từ đơn hàng
      product_name = @donhang.tensanpham
      quantity_ordered = @donhang.soluong

      # Tìm sản phẩm tương ứng trong bảng Sanpham
      product = Sanpham.find_by(ten: product_name)

      if product
        # Kiểm tra số lượng tồn kho
        if product.soluong >= quantity_ordered
          # Cập nhật số lượng sản phẩm trong Sanpham
          product.update(soluong: product.soluong - quantity_ordered)
        else
          # Nếu số lượng không đủ, thông báo lỗi
          render json: { error: "Số lượng sản phẩm không đủ" }, status: :unprocessable_entity
          return
        end
      else
        # Nếu không tìm thấy sản phẩm, thông báo lỗi
        render json: { error: "Sản phẩm không tồn tại" }, status: :unprocessable_entity
        return
      end

      render json: { message: "Đặt hàng thành công!" }, status: :created
    else
      render json: @donhang.errors, status: :unprocessable_entity
    end
  end

  private

  def donhang_params
    params.require(:donhang).permit(:hoten, :sdt, :email, :diachi, :tensanpham, :soluong, :trangthaithanhtoan, :tongthanhtoan, :ngaydathang)
  end
end
