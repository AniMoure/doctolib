# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
gem 'faker'

5.times do
	doc = Doctor.create(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		postal_code: Faker::Code.sin
	)
	spec = Specialty.create(
		name: Faker::HeyArnold.character
	)

	doc.specialties << spec

	pat = Patient.create(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name
	)
	appointment = Appointment.create(
		date: Faker::Date.forward(30),
    doctor_id: rand((Doctor.first.id)..(Doctor.last.id)),
    patient_id: rand((Patient.first.id)..(Patient.last.id))
	)
	city = City.create(
		city_name: Faker::WorldCup.city,
		doctor_id: rand((Doctor.first.id)..(Doctor.last.id)),
    patient_id: rand((Patient.first.id)..(Patient.last.id)),
    appointment_id: rand((Appointment.first.id)..(Appointment.last.id))
	)
end