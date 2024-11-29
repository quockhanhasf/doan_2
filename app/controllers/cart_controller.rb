class CartController < ApplicationController
  before_action :require_login # Đảm bảo người dùng đã đăng nhập

  def add_to_cart
    product_name = params[:product_name]
    quantity = params[:quantity]

    # Lấy tài khoản hiện tại
    current_account = current_user

    # Lấy thông tin giỏ hàng hiện tại, nếu chưa có thì tạo mới
    cart = current_account.giohang.present? ? JSON.parse(current_account.giohang) : {}

    # Thêm hoặc cập nhật sản phẩm trong giỏ hàng
    if cart[product_name]
      cart[product_name] += quantity.to_f
    else
      cart[product_name] = quantity.to_f
    end

    # Lưu lại giỏ hàng
    current_account.update(giohang: cart.to_json)

    render json: { success: true, cart: cart }, status: :ok
  rescue StandardError => e
    render json: { success: false, error: e.message }, status: :unprocessable_entity
  end





  # Xóa sản phẩm khỏi giỏ hàng
  def remove_from_cart
    product_name = params[:product_name]

    # Lấy tài khoản hiện tại
    current_account = current_user

    # Lấy thông tin giỏ hàng hiện tại
    cart = current_account.giohang.present? ? JSON.parse(current_account.giohang) : {}

    # Xóa sản phẩm nếu tồn tại
    if cart.key?(product_name)
      cart.delete(product_name)
      current_account.update(giohang: cart.to_json)
      render json: { success: true, cart: cart }, status: :ok
    else
      render json: { success: false, error: "Sản phẩm không tồn tại trong giỏ hàng." }, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: { success: false, error: e.message }, status: :unprocessable_entity
  end





  def update_cart
    product_name = params[:product_name]
    new_quantity = params[:quantity].to_f

    # Lấy thông tin giỏ hàng
    cart = current_user.giohang.present? ? JSON.parse(current_user.giohang) : {}

    # Cập nhật số lượng sản phẩm
    if cart[product_name]
      cart[product_name] = new_quantity
      current_user.update(giohang: cart.to_json)
      render json: { success: true, cart: cart }, status: :ok
    else
      render json: { success: false, error: "Sản phẩm không tồn tại trong giỏ hàng." }, status: :unprocessable_entity
    end
  end

  def order
    selected_products_param = params[:selected_products]

    # Chuyển `selected_products` thành mảng nếu nó không phải mảng
    @selected_products = if selected_products_param.is_a?(String)
                          JSON.parse(selected_products_param) rescue []
    else
                           selected_products_param || []
    end

    # Lấy thông tin sản phẩm và số lượng
    @products = @selected_products.map do |product_name|
      product = Sanpham.find_by(ten: product_name)
      quantity = JSON.parse(current_user.giohang)[product_name] if product
      { name: product_name, product: product, quantity: quantity }
    end.compact
  end


  def create_order
    # Lấy dữ liệu từ params
    hoten = params[:fullname]
    sdt = params[:phone]
    xa = params[:ward]
    huyen = params[:district]
    tinh = params[:province]
    diachi_cuthe = params[:address]
    diachi = "#{diachi_cuthe}, #{xa}, #{huyen}, #{tinh}" # Địa chỉ đầy đủ
    trangthaithanhtoan = params[:payment_status]
    tongthanhtoan = params[:total_payment]
    tensanpham = @products.map { |item| item[:product].ten }.join(", ")
    soluong = @products.map { |item| item[:quantity].to_i }.join(", ")

    # Tạo và lưu đơn hàng
    donhang = Donhang.new(
      hoten: hoten,
      sdt: sdt,
      xa: xa,
      huyen: huyen,
      tinh: tinh,
      diachi: diachi,
      tongthanhtoan: tongthanhtoan,
      trangthaithanhtoan: trangthaithanhtoan,
      tensanpham: tensanpham,
      soluong: soluong,
      ngaydathang: Time.current
    )

    # Kiểm tra và xử lý kết quả
    if donhang.save
      flash[:success] = "Đặt hàng thành công!"
      redirect_to root_path
    else
      flash[:error] = "Đặt hàng thất bại. Vui lòng kiểm tra lại thông tin."
      redirect_to cart_path
    end
  end



  private

  def require_login
    unless current_user
      render json: { success: false, error: "Bạn cần đăng nhập để sử dụng giỏ hàng." }, status: :unauthorized
    end
  end
end
