# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

Appointment.destroy_all
User.destroy_all

file = URI.open('https://images.unsplash.com/photo-1595956553066-fe24a8c33395?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80')
new_user = User.create!(first_name: "Fernand",
                        last_name: "Louis",
                        email: "antoine.camarasa@gmail.com",
                        password: "password",
                        therapist: false,
                        weight: "67",
                        height: "170",
                        birthday: "1995-06-19",
                        phone_number: "0667049192"
                      )
new_user.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')


file = URI.open('https://images.unsplash.com/photo-1568923066121-fb6216cf26f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80')
new_therapist = User.create!(first_name: "Geraldine",
                        last_name: "Lemoine",
                        email: "geraldine.lemoine@gmail.com",
                        password: "password",
                        therapist: true,
                        speciality: "Sport"
                      )
new_user.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')

new_appointment = Appointment.create!(date: DateTime.new(2022,04,20,8,37,48,"+04:00"),
                                      therapist: new_therapist,
                                      user: new_user
)

