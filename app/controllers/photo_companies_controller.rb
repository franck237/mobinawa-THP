class PhotoCompaniesController < ApplicationController
  def create
  	@company = Company.find(params[:user_id])
    @company.photo_companies.attach(params[:photo_companies])
    redirect_to(company_path(@company))
  end
end
