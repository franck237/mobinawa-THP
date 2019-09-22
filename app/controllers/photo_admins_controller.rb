class PhotoAdminsController < ApplicationController
	def create
    @admin = Admin.find(params[:admin_id])
    @admin.photo_admin.attach(params[:photo_admin])
    redirect_to(admin_path(@admin))
  end
end
