class OrderMailer < ActionMailer::Base

  default from: "luke_hr@163.com"

  def order_email(order)
    @order = order
    mail(to: @order.email, subject: "欢迎参与路克路由：#{@order.product.title}", content_type: "text/html")
  end
end
