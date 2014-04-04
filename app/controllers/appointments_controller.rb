class AppointmentsController < ApplicationController
  before_action :login_required
  before_action :admin_required , only: [:create,:new]

  def index
  	if current_user.admin?
    	@appointments=Appointment.order("created_at DESC").includes(:admin,:tab_user,:doctor,:medical_shop).load
    else
  	@appointments = current_user.appointments.pending
    end
  end

	def new
		@appointment=Appointment.new
	end



	def create
		@tab_user = TabUser.find_by(:name => appointment_params[:tab_user_name]) if appointment_params[:tab_user_name].present?
		@doctor_ids ||=  appointment_params[:doctor_tokens].split(",").map(&:to_i) if appointment_params[:doctor_tokens].present?
		@doctors=Doctor.find @doctor_ids
		@shop_name ||= MedicalShop.find_by(:shop_name => appointment_params[:medical_shop_name]) if appointment_params[:medical_shop_name].present?
		@assigned_by = current_user
		if appointment_params[:medical_shop_name].present?
			@appointment = Appointment.new(medical_shop: @shop_name , tab_user: @tab_user , admin_id: @assigned_by.id)

		elsif appointment_params[:doctor_tokens].present?
			@doctors.each do |doctor|
			  @appointment = Appointment.create(doctor: doctor, tab_user: @tab_user , admin_id: @assigned_by.id)
		  end
		end
		respond_to do |format|
			if @appointment.save
				format.html { redirect_to appointments_path, notice: 'Appointment successfully created.' }
        format.json { render action: 'new', status: :created, location: @tab_user }
			else
				format.html { render action: 'new' }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
			end
		end
	end

	def show
		@appointment = Appointment.find(params[:id])
#		@survey_report = @appointment.report.new
		@appointment_status=Appointment.appointment_status
	end

	def edit
	end

  def completed
    @completed = Appointment.where(status: 'Completed')
    respond_to do |format|
      format.html
      format.xlsx { render xlsx: :completed, filename: "Report" }
   end
  end

	def update
	end


	private

	def report_params
  end

	def appointment_params
		params.require(:appointment).permit(:tab_user_name,:doctor_name,:medical_shop_name,:doctor_tokens)
	end
end
