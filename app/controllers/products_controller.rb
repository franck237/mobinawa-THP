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
    @product = Product.new(title: params[:title], description: params[:description], price: params[:price], image_product: params[:image_product], quantity: params[:quantity], status: params[:status])
      if @product.save
        redirect_to admin_product_path(@product.id)
      else
        render 'new'
      end
  end

  def update
  
  end

  def destroy
    @product = Product.destroy

  end

end