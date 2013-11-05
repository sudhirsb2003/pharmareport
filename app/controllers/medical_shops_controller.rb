class MedicalShopsController < ApplicationController

	def index
		if params[:term].present?
      @medical_shop = MedicalShop.order(:shop_name).where("shop_name ilike ?","%#{params[:term]}%")
      render json: @medical_shop.map(&:shop_name)
    else
      @medical_shop= MedicalShop.all
      render html: @medical_shop
    end
	end
end
