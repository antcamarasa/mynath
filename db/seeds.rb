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

file = URI.open('https://images.unsplash.com/photo-1607990281513-2c110a25bd8c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1268&q=80')
new_user = User.create!(first_name: "Antoine",
                        last_name: "Louis",
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

file = URI.open('https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bWFufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60')
new_therapist = User.create!(first_name: "Louis",
                        last_name: "Lemoine",
                        email: "louis@gmail.com",
                        password: "password",
                        therapist: true,
                        speciality: "Sport"
                      )
new_therapist.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')

new_appointment = Appointment.create!(date_time: DateTime.new(2022, 4, 11, 10, 0),
                                      time: Time.new(2022, 4, 11, 10, 0),
                                      therapist: new_therapist,
                                      user: new_user
)
new_appointment = Appointment.create!(date_time: DateTime.httpdate('Sat, 03 Feb 2020 04:05:06 GMT'),
                                      time: Time.new(2020, 2, 3, 4, 5, 6),
                                      therapist: new_therapist,
                                      user: new_user
)
new_prescription = Prescription.create!(description: "Mal de tête",
                                        date: new_appointment.date_time,
                                        appointment: new_appointment
)
file = URI.open('https://www.researchgate.net/profile/Sandra-Benavides/publication/228331607/figure/fig4/AS:667613038387209@1536182760366/Indicate-why-the-prescription-is-not-appropriate-as-written.png')
new_prescription.document.attach(io: file, filename: 'prescription.png', content_type: 'document/webp')


file = URI.open('https://images.unsplash.com/photo-1568923066121-fb6216cf26f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80')
new_therapist_1 = User.create!(first_name: "Gerard",
                        last_name: "Louis",
                        email: "gerard@gmail.com",
                        password: "password",
                        therapist: true,
                        speciality: "Sport"
                      )
new_therapist_1.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')

file = URI.open('https://images.unsplash.com/photo-1607990281513-2c110a25bd8c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1268&q=80')
new_therapist_2 = User.create!(first_name: "Souraya",
                        last_name: "Chenai",
                        email: "souraya@gmail.com",
                        password: "password",
                        therapist: true,
                        speciality: "Digestion"
                      )
new_therapist_2.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')

file = URI.open('https://images.unsplash.com/photo-1568923066121-fb6216cf26f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80')
new_therapist_3 = User.create!(first_name: "Natalie",
                        last_name: "Hernandez",
                        email: "nataliea@gmail.com",
                        password: "password",
                        therapist: true,
                        speciality: "Digestion"
                      )
new_therapist_3.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/lewagonss/image/upload/v1647859584/development/naturopathe_xbrz6l.jpg')
new_therapist_4 = User.create!(first_name: "Lea",
                        last_name: "Amigues",
                        email: "josephine@gmail.com",
                        password: "password",
                        therapist: true,
                        speciality: "Stress"
                      )
new_therapist_4.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')

file = URI.open('https://images.unsplash.com/photo-1568923066121-fb6216cf26f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80')
new_therapist_5 = User.create!(first_name: "Basile",
                        last_name: "Maurice",
                        email: "basile@gmail.com",
                        password: "password",
                        therapist: true,
                        speciality: "Stress"
                      )
new_therapist_5.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')


file = URI.open('https://images.unsplash.com/photo-1568923066121-fb6216cf26f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80')
new_therapist_6 = User.create!(first_name: "Laurent",
                        last_name: "Mirot",
                        email: "laurent@gmail.com",
                        password: "password",
                        therapist: true,
                        speciality: "Hormones"
                      )
new_therapist_6.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')


file = URI.open('https://images.unsplash.com/photo-1568923066121-fb6216cf26f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80')
new_therapist_7 = User.create!(first_name: "Myriam",
                        last_name: "Abd",
                        email: "myriame@gmail.com",
                        password: "password",
                        therapist: true,
                        speciality: "Hormones"
                      )
new_therapist_7.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')

file = URI.open('https://images.unsplash.com/photo-1568923066121-fb6216cf26f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80')
new_therapist_8 = User.create!(first_name: "Fernand",
                        last_name: "Lilo",
                        email: "fernad@gmail.com",
                        password: "password",
                        therapist: true,
                        speciality: "Migraine"
                      )
new_therapist_8.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')


file = URI.open('https://images.unsplash.com/photo-1568923066121-fb6216cf26f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80')
new_therapist_9 = User.create!(first_name: "Elsa",
                        last_name: "ploutic",
                        email: "elsa@gmail.com",
                        password: "password",
                        therapist: true,
                        speciality: "Fertilité"
                      )
new_therapist_9.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')


file = URI.open('https://images.unsplash.com/photo-1568923066121-fb6216cf26f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80')
new_therapist_10 = User.create!(first_name: "Marc",
                        last_name: "Zukerberg",
                        email: "marc-zuckergerfe@gmail.com",
                        password: "password",
                        therapist: true,
                        speciality: "Equilibre alimentaire"
                      )
new_therapist_10.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')


file = URI.open('https://images.unsplash.com/photo-1568923066121-fb6216cf26f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80')
new_therapist_11 = User.create!(first_name: "Rodrigo",
                        last_name: "El patron",
                        email: "rodrigo@gmail.com",
                        password: "password",
                        therapist: true,
                        speciality: "Maladie auto-immune"
                      )
new_therapist_11.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')
