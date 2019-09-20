class PhotoProductsController < ApplicationController
  def create
  	@product = Product.new
    @product.photo_product.attach(params[:photo_product])
    redirect_to new_product_path
  end
end
