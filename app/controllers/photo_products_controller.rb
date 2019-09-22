class PhotoProductsController < ApplicationController
  def create
  	@product = Product.new
    @product.photo_product.attach(params[:photo_products])
    redirect_to new_product_path
  end
end
