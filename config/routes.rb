Rails.application.routes.draw do
  get "products/index"
  # Trang chủ
  root "home#index"
  get "trangchu", to: "home#index"

  # Đăng nhập/đăng xuất
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy", as: "logout"

  # Người dùng
  resources :users, only: [ :show, :update ]

  # Giỏ hàng
  get "/cart", to: "cart#index"
  post "cart/add_to_cart", to: "cart#add_to_cart", as: "add_to_cart"
  post "cart/remove_from_cart", to: "cart#remove_from_cart", as: "remove_from_cart"
  post "cart/update_cart", to: "cart#update_cart", as: "update_cart"
  post "/set_selected_products", to: "cart#set_selected_products"

   # Tìm sản phẩm
   get "sanpham/search", to: "sanphams#search"




  # Đặt hàng
  get "/order", to: "cart#order", as: "order" # Truy cập qua GET
  post "/cart/create_order", to: "cart#create_order", as: "create_order"
  resources :donhangs, only: [ :create ]

  resources :giaidoan, only: [ :index ]

  resources :giaohang, only: [ :index ] do
    member do
      patch :xacnhan
    end
  end






  # Thanh toán

  get "/thanh_toan", to: "payments#thanh_toan", as: "thanh_toan"
  get "/payment/success", to: "payments#payment_success", as: "payment_success"
  post "/payment/webhook", to: "payments#payment_webhook", as: "payment_webhook"






  # Xử lý quên mật khẩu
  post "forgot_password", to: "passwords#forgot_password"
  post "verify_forgot_code", to: "passwords#verify_forgot_code"
  post "reset_password", to: "passwords#reset_password"

  # Đăng ký
  post "register", to: "registrations#create"
  post "verify_registration_code", to: "registrations#verify_code"


  # Quản lý sản phẩm
  resources :sanphams, only: [ :index, :create, :update, :destroy ]


  # Nhắn tin
  resources :messages, only: [ :index, :create ]
end
