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


  # Đặt hàng
  get "/order", to: "cart#order", as: "order" # Truy cập qua GET
  post "/cart/create_order", to: "cart#create_order", as: "create_order"
  resources :donhangs, only: [ :create ]





  # Xử lý quên mật khẩu
  post "forgot_password", to: "passwords#forgot_password"
  post "verify_forgot_code", to: "passwords#verify_forgot_code"
  post "reset_password", to: "passwords#reset_password"

  # Đăng ký
  post "register", to: "registrations#create"
  post "verify_registration_code", to: "registrations#verify_code"

  resources :sanphams, only: [ :index ]
  resources :sanphams, only: [ :update, :destroy ]


  # Nhắn tin
  resources :messages, only: [ :index, :create ]
end
