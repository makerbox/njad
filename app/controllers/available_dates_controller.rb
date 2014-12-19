class AvailableDatesController < ApplicationController
  before_action :set_available_date, only: [:show, :edit, :update, :destroy]

  def index
    @available_dates = AvailableDate.all
    respond_with(@available_dates)
  end

  def show
    respond_with(@available_date)
  end

  def new
    @available_date = AvailableDate.new
    respond_with(@available_date)
  end

  def edit
  end

  def create
    @available_date = AvailableDate.new(available_date_params)
    @available_date.save
    respond_with(@available_date)
  end

  def update
    @available_date.update(available_date_params)
    respond_with(@available_date)
  end

  def destroy
    @available_date.destroy
    respond_with(@available_date)
  end

  private
    def set_available_date
      @available_date = AvailableDate.find(params[:id])
    end

    def available_date_params
      params.require(:available_date).permit(:avail, :product_id)
    end
end
