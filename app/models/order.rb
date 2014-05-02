class Order < ActiveRecord::Base

  belongs_to :product
  belongs_to :user

  after_create :send_email

  validates_presence_of :contact_person, :email, :mobile, :pnumber, :check_in, :leave_away, :product_id

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  def send_email
    OrderMailer.order_email(self).deliver
  end

end
