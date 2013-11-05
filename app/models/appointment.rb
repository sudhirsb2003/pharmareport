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


  def tab_user_name
  	tab_user.try(:name)
  end

  def tab_user_name=(name)
  	self.tab_user = TabUser.find_by_name(name) if name.present?
  end
  
  def medical_shop_name
  	medical_shop.try(:shop_name)
  end

  def medical_shop_name=(name)
  	self.medical_shop = TabUser.find_by_shop_name(name) if name.present?
  end

end
