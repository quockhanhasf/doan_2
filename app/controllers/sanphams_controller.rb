class SanphamsController < ApplicationController
  def index
    @sanphams = Sanpham.all
  end


  def search
    query = params[:query]
    products = Sanpham.where("ten LIKE ?", "%#{query}%")
    render json: products
  end


  def create
    @sanpham = Sanpham.new(sanpham_params)

    # Xử lý ảnh nếu có
    if params[:sanpham] && params[:sanpham][:hinhanh]
      uploaded_file = params[:sanpham][:hinhanh]
      file_name = "#{SecureRandom.hex(10)}_#{uploaded_file.original_filename}"
      file_path = Rails.root.join("public", "uploads", file_name)

      # Lưu tệp vào thư mục `public/uploads`
      File.open(file_path, "wb") do |file|
        file.write(uploaded_file.read)
      end

      # Gán đường dẫn ảnh vào thuộc tính `hinhanh`
      @sanpham.hinhanh = "/uploads/#{file_name}"
    end

    if @sanpham.save
      render json: { success: true, message: "Thêm sản phẩm thành công!", hinhanh: @sanpham.hinhanh }
    else
      render json: { success: false, message: @sanpham.errors.full_messages.join(", ") }, status: :unprocessable_entity
    end
  end
  def update
    @sanpham = Sanpham.find(params[:id])

    if @sanpham.update(sanpham_params)
      render json: { gia: @sanpham.gia }, status: :ok
    else
      render json: { error: @sanpham.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @sanpham = Sanpham.find(params[:id])
    if @sanpham.destroy
      render json: { message: "Sản phẩm đã được xoá" }, status: :ok
    else
      render json: { error: "Sản phẩm đã được xoá" }, status: :unprocessable_entity
    end
  end

  private

  def sanpham_params
    params.require(:sanpham).permit(:ten, :hinhanh, :soluong, :gia)
  end
end
