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
  

  private

  def require_login
    unless current_user
      render json: { success: false, error: "Bạn cần đăng nhập để sử dụng giỏ hàng." }, status: :unauthorized
    end
  end
end
