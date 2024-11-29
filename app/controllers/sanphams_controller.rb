class SanphamsController < ApplicationController
  def index
    @sanphams = Sanpham.all
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
      render json: { error: "Xoá thất bại" }, status: :unprocessable_entity
    end
  end

  private

  def sanpham_params
    params.require(:sanpham).permit(:gia)
  end
end
