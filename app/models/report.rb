class Report < ActiveRecord::Base
 belongs_to :tab_user
 belongs_to :doctor
 belongs_to :medical_shop
 belongs_to :appointment
end
