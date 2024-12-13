class GiaohangController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only

  def index
    @donhangs = Donhang.all
  end

  def xacnhan
    donhang = Donhang.find(params[:id])

    # Tách các sản phẩm từ thuộc tính thongtinsanpham
    sanpham_details = donhang.thongtinsanpham.to_s.split(",").map(&:strip)

    # Duyệt qua từng sản phẩm để xử lý logic trừ số lượng
    ActiveRecord::Base.transaction do
      sanpham_details.each do |detail|
        match = detail.match(/(.+)\s(\d+)\s?(kg|thùng|bao)/)
        if match
          tensanpham = match[1].strip
          soluong_dat = match[2].to_i

          sanpham = Sanpham.find_by(ten: tensanpham)

          if sanpham.nil? || sanpham.soluong < soluong_dat
            render json: { error: "Không đủ số lượng hoặc sản phẩm '#{tensanpham}' không tồn tại!" }, status: :unprocessable_entity
            return
          end

          sanpham.update!(soluong: sanpham.soluong - soluong_dat)
        else
          render json: { error: "Dữ liệu sản phẩm không hợp lệ: '#{detail}'!" }, status: :unprocessable_entity
          return
        end
      end

      donhang.update!(trangthai: "Đã xác nhận")
    end

    render json: { message: "Đơn hàng đã được xác nhận!", id: donhang.id, trangthai: donhang.trangthai }
  rescue => e
    render json: { error: "Có lỗi xảy ra: #{e.message}" }, status: :unprocessable_entity
  end

  private

  def admin_only
    redirect_to root_path, alert: "Bạn không có quyền truy cập!" unless current_user.admin?
  end
end
