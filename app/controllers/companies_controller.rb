class CompaniesController < ApplicationController
  def index
    @companies = Company.all.order(:name)
  end

  def show
    @company = Company.find(params[:id])
    @products = @company.products.order(:title)
  end

  def new
    @company = Company.new 
  end

  def create
    @company = Company.new(number: params[:number], name: params[:name], email: params[:email], website: params[:website], logo: params[:logo], description: params[:description], sub_sector_id: params[:sub_sector_id], admin_id: params[:admin_id], country_id: params[:country_id])
      if @company.save
        redirect_to company_path(@Company.id)
      else
        render 'new'
      end
  end

  def update
    @company = Company.find(params[:id])
    @admin = @company.admin_id
  end

  def destroy
    @company = Company.destroy
  end

  def search
    @companies = Company.all.order(:name)
    if params[:search].blank?
      flash[:alert] = "Empty field!"
      redirect_to companies_path
      return
    else
      @parameter = params[:search].downcase  
      @results = Company.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
    end
  end
end
