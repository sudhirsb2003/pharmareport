# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#   TabUser.create!(name: 'sudhir', password: "sudhirsb", admin: "true")
#   TabUser.create!(name: 'yogesh', password: 'sudhirsb', admin: 'false')
#   TabUser.create!(name: 'chetan', password: 'sudhirsb', admin: 'false')   


#   degree = ["MBBS", "BHMS", "BAMS", "BDS", "MD", "MDS", "Physiatrist"]

#   100.times do
#    doctor = Doctor.create!(:name=> Faker::Name.name, :degree => degree.sample, :address => Faker::Address.street_address )
#   end

#   shop = ["ajit medical store", "noor medical store", "shanti medical store", "intex medical store", "shumma medical store", "ridhhi medical store", "royal medical store", "new medical store", "gateway medical store", "Gajini medical store", "Gajanan medical store", "sakuntala medical store", "kgn medical store", "flex medical store", "rajtilak medical store", "mahalakshmi medical store", "thos medical store", "slok medical store", "sonal medical store", "shiva medical store"]

#   20.times do
#     medical_shop = MedicalShop.create!(:shop_name => shop.shift, :shop_address=> Faker::Address.street_address)
#   end


#   30.times do
#    Appointment.create!(:doctor_id => (1...100).sort_by{rand}[1], :tab_user_id => 2 , :admin_id => 1, :status => "Pending")
#   end 

  30.times do
    Appointment.create!(:medical_shop_id => (1..20).sort_by{rand}[1], :tab_user_id => (2..3).sort_by{rand}[1], :admin_id => 1, :status => "Pending")
  end
