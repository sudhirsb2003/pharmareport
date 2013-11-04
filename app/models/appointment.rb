class Appointment < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :medical_shop
  belongs_to :tab_user

  def doctor_name
  	doctor.try(:name)
  end

  def doctor_name=(name)
    self.doctor = Doctor.find_by_name(name) if name.present?
  end
end
