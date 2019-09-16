class CompaniesController < ApplicationController
  def index
    @companies = Company.all   
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new 
  end

  def create
    @company = Company.new(number: params[:number], name: params[:name], email: params[:email], website: params[:website], logo: params[:logo], description: params[:description], sub_sector_id: params[:sub_sector_id], admin_id: params[:admin_id], country_id: params[:country_id])
      if @company.save
        redirect_to Company_path(@Company.id)
      else
        render 'new'
      end
  end

  def update
  
  end

  def destroy
    @Company = Company.destroy
  end
end
