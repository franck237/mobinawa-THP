class ProductsController < ApplicationController
before_action :authenticate_admin!, except: [:index, :show]
  def index
    @products = Product.all  
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @photo.photo_product.present?
    @product.image_product = @product.photo_product
    end
      if @product.save
        redirect_to @product, notice: 'Product was successfully created.'
      else
        render 'new'
      end
  end

  def update
  
  end

  def destroy
    @product = Product.destroy
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :image_product, :quantity, :status, :company_id, :photo_product)  
  end

end