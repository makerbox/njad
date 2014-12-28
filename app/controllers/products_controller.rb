class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:new, :create, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  respond_to :html, :xml, :json

  def authorize
    if !current_user.has_role? :admin
      redirect_to :root
    end
  end

  def wish(product)
    @wishproduct = WishProduct.new(user: current_user, product: product)
    @wishproduct.save
  end

  def index
    @products = Product.all
    if params[:search_input]
      search_input = params[:search_input]
      findthis = search_input.downcase
      if Product.near(search_input, 10, :units => :km).any?
        @products = Product.near(search_input, 10, :units => :km)
      else
        @products = Product.where('lower(description) LIKE ? OR lower(street) LIKE ? OR lower(suburb) LIKE ? OR lower(state) LIKE ? OR lower(city) LIKE ?', "%#{findthis}%", findthis, findthis, findthis, findthis)
      end
    end
    respond_with(@products)
  end

  def show
    respond_with(@product)
  end

  def new
    @product = Product.new
    respond_with(@product)
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @product.save
    respond_with(@product)
  end

  def update
    @product.update(product_params)
    respond_with(@product)
  end

  def destroy
    @product.destroy
    respond_with(@product)
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :capacity, :longitude, :latitude, :street, :suburb, :city, :state, :contact_name, :contact_number, :contact_email)
    end
end
