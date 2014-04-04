class DoctorsController < ApplicationController
	def index
	if params[:q]
	@doctors=Doctor.order(:name).where("name ilike ?","%#{params[:q]}%").page(params[:page]).per(25)
	else
	@doctors = Doctor.all
	end
    respond_to do |format|
       format.html # show.html.erb
       format.json { render json: @doctors }
     end
	end

	def new
	 @doctor = Doctor.new
	end

  def create
   @doctor = Doctor.create(doctor_params)
   @doctor.save
   redirect_to doctors_path, :notice => "done!"
  end

	private
	def doctor_params
		params.require(:doctor).permit(:name,:address,:degree)
	end

end
