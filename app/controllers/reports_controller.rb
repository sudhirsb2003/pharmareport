class ReportsController < ApplicationController

  def create
  @appointment=Appointment.find(params[:appointment_id])
   @report = @appointment.build_report(report_params)
   if @report.save
    @appointment.update_attributes(:status => "Completed")
   end
   redirect_to appointments_path, :notice => "thank you !report successfully created!"
  end

	private

	def report_params
		params.require(:report).permit(:tab_user_id,:doctor_id,:appointment_id, :medical_shop_id,:product_shown, :product_copy, :product_offer, :doctors_comment, :doctor_have_stock, :browsher_shown, :sample_given, :photo)
	end

end
