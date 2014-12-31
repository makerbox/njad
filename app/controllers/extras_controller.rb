class ExtrasController < ApplicationController
  before_action :set_extra, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  def index
    @extras = Extra.all
    respond_with(@extras)
  end

  def show
    respond_with(@extra)
  end

  def new
    @extra = Extra.new
    respond_with(@extra)
  end

  def edit
  end

  def create
    @extra = Extra.new(extra_params)
    @extra.save
    respond_with(@extra, location: new_extra_path)
  end

  def update
    @extra.update(extra_params)
    respond_with(@extra)
  end

  def destroy
    @extra.destroy
    respond_with(@extra)
  end

  private
    def set_extra
      @extra = Extra.find(params[:id])
    end

    def extra_params
      params.require(:extra).permit(:name, :description, :price)
    end
end
