class TabUser < ActiveRecord::Base

	validates :name ,presence: true
	validates :employee_uid , presence: true , uniqueness: true
	has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }#, :default_url => "/images/:style/missing.png"
end
