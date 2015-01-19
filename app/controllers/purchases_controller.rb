class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]
  respond_to :html
  def index
    @purchases = Purchase.all
    respond_with(@purchases)
  end

  def show
    respond_with(@purchase)
  end

  def new
    @purchase = Purchase.new
    @booking = Booking.find(params[:booking_id])
    productcost = @booking.product.price * 100
    extracost = @booking.extras.sum(:price) * 100
    @price = (extracost + productcost).to_i
    respond_with(@purchase)
  end

  def edit
  end

  def create
    @purchase = Purchase.new(purchase_params)
    # @price = @purchase.price.to_i
    @purchase.user = current_user
    if @purchase.save
      begin
        token = params[:stripeToken]
        # Create a Customer
        customer = Stripe::Customer.create(
          :card => token,
          :description => current_user.email
        )
        charge = Stripe::Charge.create(
          :customer    => customer.id,
          :amount      => @price,
          :description => 'Not Just a Date booking',
          :currency    => 'aud'
        )

      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_purchase_path
      else
        respond_with(@purchase)
      end
    end
  end

  def update
    @purchase.update(purchase_params)
    respond_with(@purchase)
  end

  def destroy
    @purchase.destroy
    respond_with(@purchase)
  end

  private
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    def purchase_params
      params.require(:purchase).permit(:price, :user_id, :product_id, :date_selected, :booking_id)
    end
end
