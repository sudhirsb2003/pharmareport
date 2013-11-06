class Doctor < ActiveRecord::Base
  has_many :reports
	validates :name , presence: true
	validates :address , presence: true
end
