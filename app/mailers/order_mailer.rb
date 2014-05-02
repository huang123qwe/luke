class OrderMailer < ActionMailer::Base

  default from: "luke_hr@163.com"

  def order_email(order_id)
    @order = Order.where(id: order_id).first
    mail(to: @order.email, subject: "欢迎参与路克旅游：#{@order.product.title}", content_type: "text/html")
  end
end
