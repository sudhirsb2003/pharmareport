class AppointmentsController < ApplicationController
  before_action :login_required
  before_action :admin_required , only: [:create,:new]


  def index
  	if current_user.admin?
    	@appointments=Appointment.includes(:admin,:tab_user,:doctor,:medical_shop).all
    else
  	@appointments=current_user.appointments
    end
  end

	def new
		@appointment=Appointment.new
	end



	def create
		@tab_user = TabUser.find_by(:name => appointment_params[:tab_user_name]) if appointment_params[:tab_user_name].present?
		@doctor ||= Doctor.find_by(:name => appointment_params[:doctor_name]) if appointment_params[:doctor_name].present?
		@shop_name ||= MedicalShop.find_by(:shop_name => appointment_params[:medical_shop_name]) if appointment_params[:medical_shop_name].present?
		@assigned_by = current_user
		if appointment_params[:medical_shop_name].present?
			@appointment = Appointment.new(medical_shop: @shop_name , tab_user: @tab_user , admin_id: @assigned_by.id)

		elsif appointment_params[:doctor_name].present?
			@appointment = Appointment.new(doctor: @doctor, tab_user: @tab_user , admin_id: @assigned_by.id)
		end
		respond_to do |format|
			if @appointment.save
				format.html { redirect_to @appointment, notice: 'Appointment successfully created.' }
        format.json { render action: 'new', status: :created, location: @tab_user }
			else
				format.html { render action: 'new' }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
			end
		end
	end

	def show
		@appointment = Appointment.find(params[:id])
		@survey_report = @appointment.reports.new
		@appointment_status=Appointment.appointment_status
	end

	def edit
	end

	def update
	end


	private

	def report_params
  end

	def appointment_params
		params.require(:appointment).permit(:tab_user_name,:doctor_name,:medical_shop_name)
	end
end
