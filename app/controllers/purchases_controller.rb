class PurchasesController < ApplicationController
  def new
  end

	def create
		product = Product.find_by(params[:product_id])
		@amount = product.price * 100
		customer = Stripe::Customer.create(
		:email => current_user.email,
		:card  => params[:stripeToken]
		)

		charge = Stripe::Charge.create(
		:customer    => customer.id,
		:amount      => @amount.to_i,
		:description => 'not just a date purchase',
		:currency    => 'aud'
		)

		@purchase = Purchase.new
		@purchase.user = current_user
		@purchase.product = product
		@purchase.save
		# send notification email to customer and Heloise
		rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to products_path
	end
end
