class Doctor < ActiveRecord::Base
	belongs_to :tab_user

	validates :name , presence :true 
	validates :address , presence :true 
end
