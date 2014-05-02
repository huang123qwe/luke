class OrderMailWorker
  include Sidekiq::Worker

  def perform(order_id)
    OrderMailer.order_email(order_id).deliver
  end
end