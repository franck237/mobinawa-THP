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
    if @product.photo_products.attached?
    @product.image_product = @product.photo_products
    end
      if @product.save
        redirect_to @product, notice: 'Product was successfully created.'
      else
        render 'new'
      end
  end

  def update
    if @product.update(product_params)
         redirect_to product_path, notice: 'Product was successfully updated.'
      else
        render 'edit'
    end
  end

  def destroy
    @product = Product.destroy
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:title, :description, :price, :image_product, :quantity, :status, :company_id, :photo_product)  
  end

end