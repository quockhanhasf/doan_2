class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = Message.all.order(created_at: :asc) # Lấy tất cả tin nhắn, sắp xếp theo thời gian
    @message = Message.new # Dùng cho form tạo tin nhắn
  end

  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      redirect_to messages_path, notice: "Tin nhắn đã được gửi!"
    else
      render :index, alert: "Có lỗi xảy ra khi gửi tin nhắn."
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
