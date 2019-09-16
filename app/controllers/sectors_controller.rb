class SectorsController < ApplicationController
  def index
    @sectors = Sector.all   
  end

  def show
    @sector = Sector.find(params[:id])
  end

  def new
    @sector = Sector.new 
  end

  def create
    @sector = Sector.new(name: params[:name], icon: params[:icon])
      if @sector.save
        redirect_to sector_path(@sector.id)
      else
        render 'new'
      end
  end

  def update
  
  end

  def destroy
    @sector = Sector.destroy
  end
end