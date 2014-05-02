class OrdersController < ApplicationController

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @product = Product.find(params[:order][:product_id])
    respond_to do |format|
      if @order.save
        format.html { redirect_to @product, notice: "谢谢你的参与！我们已经发送邮件至你的邮箱 #{@order.email}，请注意查收。" }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render :template => "products/show" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:contact_person, :email, :mobile, :pnumber, :check_in, :leave_away, :product_id, :user_id)
    end
end
