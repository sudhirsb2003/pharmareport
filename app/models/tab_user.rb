class TabUser < ActiveRecord::Base

	has_secure_password

  #validates :password , length: {minimum: 8}
	validates :name ,presence: true , uniqueness: true
	#validates :employee_uid , uniqueness: true 
	has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }#, :default_url => "/images/:style/missing.png"

	has_many :doctors

end
