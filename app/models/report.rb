class Report < ActiveRecord::Base
 belongs_to :tab_user
 belongs_to :doctor
 belongs_to :medical_shop
 belongs_to :appointment

 has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }#, :default_url => "/images/:style/missing.png"

end
