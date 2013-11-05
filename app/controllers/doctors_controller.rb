class DoctorsController < ApplicationController
	def index
		@doctors=Doctor.order(:name).where("name ilike ?","%#{params[:term]}%")
		render json: @doctors.map(&:name)
	end
end
