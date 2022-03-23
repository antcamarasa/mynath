# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
require 'date'
require 'time'


Appointment.destroy_all
User.destroy_all

file = URI.open('https://res.cloudinary.com/lewagonss/image/upload/v1648014176/MyNath/antoine_gfofig.png')
new_user = User.create!(first_name: "Antoine",
                        last_name: "Camarasa",
                        email: "antoine.camarasa@gmail.com",
                        password: "password",
                        therapist: false,
                        weight: "67",
                        height: "170",
                        birthday_date: "1995-06-19",
                        phone_number: "0667049192"
                      )
new_user.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')
new_user.photo.attached?

file = URI.open('https://res.cloudinary.com/lewagonss/image/upload/v1648014176/MyNath/myriam_eepnmi.png')
new_user_1 = User.create!(first_name: "Lucie",
                        last_name: "Ader",
                        email: "lucie@gmail.com",
                        password: "password",
                        therapist: false,
                        weight: "52",
                        height: "164",
                        birthday_date: "1992-06-23",
                        phone_number: "0667384990"
                      )
new_user_1.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')
new_user_1.photo.attached?

file = URI.open('https://res.cloudinary.com/lewagonss/image/upload/v1648014175/MyNath/roukaya_qzaewa.png')
new_user_2 = User.create!(first_name: "Claire",
                        last_name: "Colombani",
                        email: "claire@gmail.com",
                        password: "password",
                        therapist: false,
                        weight: "48",
                        height: "161",
                        birthday_date: "1990-06-23",
                        phone_number: "0667384989"
                      )
new_user_2.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')
new_user_2.photo.attached?

file = URI.open('https://res.cloudinary.com/lewagonss/image/upload/v1648014175/MyNath/sawan_c3hcd7.png')
new_therapist = User.create!(first_name: "Louis",
                        last_name: "Lemoine",
                        email: "louis@gmail.com",
                        password: "password",
                        therapist: true,
                        speciality: "Sport"
                      )
new_therapist.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')

# new_appointment = Appointment.create!(date_time: DateTime.new(2022, 4, 11, 10, 0),
#                                       time: Time.new(2022, 4, 11, 10, 0),
#                                       therapist: new_therapist,
#                                       user: new_user
# )
# new_appointment = Appointment.create!(date_time: DateTime.httpdate('Sat, 03 Feb 2020 04:05:06 GMT'),
#                                       time: Time.new(2020, 2, 3, 4, 5, 6),
#                                       therapist: new_therapist,
#                                       user: new_user
# )
# new_prescription = Prescription.create!(description: "Mal de tête",
#                                         date: new_appointment.date_time,
#                                         appointment: new_appointment
# )
# file = URI.open('https://www.researchgate.net/profile/Sandra-Benavides/publication/228331607/figure/fig4/AS:667613038387209@1536182760366/Indicate-why-the-prescription-is-not-appropriate-as-written.png')
# new_prescription.document.attach(io: file, filename: 'prescription.png', content_type: 'document/webp')


file = URI.open('https://res.cloudinary.com/lewagonss/image/upload/v1648014175/MyNath/yogesh_nfvipe.png')
new_therapist_1 = User.create!(first_name: "Gerard",
                        last_name: "René",
                        email: "gerard@gmail.com",
                        password: "password",
                        therapist: true,
                        speciality: "Sport"
                      )
new_therapist_1.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/lewagonss/image/upload/v1648014175/MyNath/souraya_vzgfcw.png')
new_therapist_2 = User.create!(first_name: "Souraya",
                        last_name: "Chenai",
                        email: "souraya@gmail.com",
                        password: "password",
                        therapist: true,
                        speciality: "Digestion"
                      )
new_therapist_2.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/lewagonss/image/upload/v1648014175/MyNath/ifediba_agyu4p.png')
new_therapist_3 = User.create!(first_name: "Natalie",
                        last_name: "Hernandez",
                        email: "nataliea@gmail.com",
                        password: "password",
                        therapist: true,
                        speciality: "Digestion"
                      )
new_therapist_3.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/lewagonss/image/upload/v1648014176/MyNath/jo_occnha.png')
new_therapist_4 = User.create!(first_name: "Jo",
                        last_name: "Amigues",
                        email: "josephine@gmail.com",
                        password: "password",
                        therapist: true,
                        speciality: "Stress"
                      )
new_therapist_4.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/lewagonss/image/upload/v1648014465/MyNath/basile_vzowtm.png')
new_therapist_5 = User.create!(first_name: "Basile",
                        last_name: "Maurice",
                        email: "basile@gmail.com",
                        password: "password",
                        therapist: true,
                        speciality: "Stress"
                      )
new_therapist_5.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')


file = URI.open('https://res.cloudinary.com/lewagonss/image/upload/v1648014175/MyNath/sawan_c3hcd7.png')
new_therapist_6 = User.create!(first_name: "Laurent",
                        last_name: "Mirot",
                        email: "laurent@gmail.com",
                        password: "password",
                        therapist: true,
                        speciality: "Hormones"
                      )
new_therapist_6.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')


file = URI.open('https://res.cloudinary.com/lewagonss/image/upload/v1648014176/MyNath/myriam_eepnmi.png')
new_therapist_7 = User.create!(first_name: "Myriam",
                        last_name: "Abd",
                        email: "myriame@gmail.com",
                        password: "password",
                        therapist: true,
                        speciality: "Hormones"
                      )
new_therapist_7.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/lewagonss/image/upload/v1648014175/MyNath/roukaya_qzaewa.png')
new_therapist_8 = User.create!(first_name: "Roukaya",
                        last_name: "Lilo",
                        email: "roukaya@gmail.com",
                        password: "password",
                        therapist: true,
                        speciality: "Migraine"
                      )
new_therapist_8.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')


file = URI.open('https://res.cloudinary.com/lewagonss/image/upload/v1648014175/MyNath/souraya_vzgfcw.png')
new_therapist_9 = User.create!(first_name: "Elsa",
                        last_name: "ploutic",
                        email: "elsa@gmail.com",
                        password: "password",
                        therapist: true,
                        speciality: "Fertilité"
                      )
new_therapist_9.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')


file = URI.open('https://res.cloudinary.com/lewagonss/image/upload/v1648014176/MyNath/antoine_gfofig.png')
new_therapist_10 = User.create!(first_name: "Marc",
                        last_name: "Zukerberg",
                        email: "marc-zuckergerfe@gmail.com",
                        password: "password",
                        therapist: true,
                        speciality: "Equilibre alimentaire"
                      )
new_therapist_10.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')


file = URI.open('https://res.cloudinary.com/lewagonss/image/upload/v1648014175/MyNath/yogesh_nfvipe.png')
new_therapist_11 = User.create!(first_name: "Rodrigo",
                        last_name: "El patron",
                        email: "rodrigo@gmail.com",
                        password: "password",
                        therapist: true,
                        speciality: "Maladie auto-immune"
                      )
new_therapist_11.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')
