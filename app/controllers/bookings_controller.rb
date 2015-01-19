class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  respond_to :html
  def index
    @bookings = Booking.all
    respond_with(@bookings)
  end

  def show
    respond_with(@booking)
  end

  def new
    @booking = Booking.new
    @product = Product.find(params[:product_id])
    @extras = Extra.where(product_id: @product.id)
    @date = (params[:date]).to_date.strftime('%e/%B/%Y')
    respond_with(@booking)
  end

  def edit
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.save
    respond_with(@booking, location: new_purchase_path(booking_id: @booking))
  end

  def update
    @booking.update(booking_params)
    respond_with(@booking)
  end

  def destroy
    @booking.destroy
    respond_with(@booking)
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:user_id, :product_id, :date, booking_extras_attributes: [:id, :extra_id, :_destroy])
    end
end
