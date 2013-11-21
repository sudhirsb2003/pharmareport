class Appointment < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :medical_shop
  belongs_to :tab_user
  belongs_to :admin , class_name: "TabUser" , foreign_key: "admin_id"
  has_one :report

  attr_reader :doctor_tokens

  scope :pending, -> { where(status: 'Pending') }  

  def doctor_tokens=(ids)
    doctor_ids = ids.split(",")
  end
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

  def doctor_address
  	doctor.address
  end

  def medical_shop_address
  	medical_shop.shop_address if medical_shop
  end

  def self.appointment_status
    ["pending","completed"]
  end

end
