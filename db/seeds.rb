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
Feedback.destroy_all
Prescription.destroy_all

#USERS

file = URI.open('https://res.cloudinary.com/lewagonss/image/upload/v1648014176/MyNath/antoine_gfofig.png')
antoine = User.create!(first_name: "Antoine",
                        last_name: "Camarasa",
                        email: "antoine.camarasa@gmail.com",
                        password: "password",
                        therapist: false,
                        weight: "67",
                        height: "170",
                        birthday_date: "1995-06-19",
                        phone_number: "0667049192"
                      )
antoine.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')
antoine.photo.attached?

file = URI.open('https://res.cloudinary.com/lewagonss/image/upload/v1648014176/MyNath/jo_occnha.png')
josephine = User.create!(first_name: "Josephine",
                        last_name: "Ader",
                        email: "josephine@gmail.com",
                        password: "password",
                        therapist: false,
                        weight: "52",
                        height: "164",
                        birthday_date: "1992-06-23",
                        phone_number: "0667384990"
                      )
josephine.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')
josephine.photo.attached?

file = URI.open('https://res.cloudinary.com/lewagonss/image/upload/v1648101898/MyNath/claire_iokpuj.png')
claire = User.create!(first_name: "Claire",
                        last_name: "Colombani",
                        email: "claire@gmail.com",
                        password: "password",
                        therapist: false,
                        weight: "48",
                        height: "161",
                        birthday_date: "1990-06-23",
                        phone_number: "0667384989"
                      )
claire.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')
claire.photo.attached?

#THERAPIST

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
souraya = User.create!(first_name: "Souraya",
  last_name: "Chenai",
  email: "souraya@gmail.com",
  password: "password",
  therapist: true,
  speciality: "Stress"
)
souraya.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/lewagonss/image/upload/v1648014175/MyNath/ifediba_agyu4p.png')
new_therapist_3 = User.create!(first_name: "Natalie",
  last_name: "Hernandez",
  email: "nataliea@gmail.com",
  password: "password",
  therapist: true,
  speciality: "Digestion"
)
new_therapist_3.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/lewagonss/image/upload/v1648014465/MyNath/basile_vzowtm.png')
new_therapist_5 = User.create!(first_name: "Basile",
  last_name: "Maurice",
  email: "basile@gmail.com",
  password: "password",
  therapist: true,
  speciality: "Regime"
)
new_therapist_5.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/lewagonss/image/upload/v1648014176/MyNath/myriam_eepnmi.png')
myriam = User.create!(first_name: "Myriam",
  last_name: "Abd",
  email: "myriame@gmail.com",
  password: "password",
  therapist: true,
  speciality: "Hormones"
)
myriam.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/lewagonss/image/upload/v1648014175/MyNath/roukaya_qzaewa.png')
roukaya = User.create!(first_name: "Roukaya",
  last_name: "Lilo",
  email: "roukaya@gmail.com",
  password: "password",
  therapist: true,
  speciality: "Migraine"
)
roukaya.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')


file = URI.open('https://res.cloudinary.com/lewagonss/image/upload/v1648101898/MyNath/lucie_kwjxvq.png')
new_therapist_9 = User.create!(first_name: "Elsa",
  last_name: "ploutic",
  email: "elsa@gmail.com",
  password: "password",
  therapist: true,
  speciality: "Fertilité"
)
new_therapist_9.photo.attach(io: file, filename: 'antoine-profil-picture.jpg', content_type: 'image/jpg')

#RDV & PRESCRIPTION & FEEDBACK

  #RDV 1 JO
hormone_josephine = Appointment.create!(date_time: DateTime.new(2021, 12, 10, 10, 0),
                                      time: Time.new(2021, 12, 10, 10, 0),
                                      therapist: myriam,
                                      user: josephine
                                    )
new_prescription = Prescription.create!(description: "Problème de boufée de chaleur",
                                    date: hormone_josephine.date_time,
                                    appointment: hormone_josephine
                                    )
file = URI.open('https://res.cloudinary.com/lewagonss/image/upload/v1648103208/MyNath/media_qua0i6.jpg')
new_prescription.document.attach(io: file, filename: 'prescription.png', content_type: 'document/jpg')

  #RDV 2 JO
migraine_josephine = Appointment.create!(date_time: DateTime.new(2021, 6, 19, 10, 0),
                                        time: Time.new(2021, 6, 19, 10, 0),
                                        therapist: roukaya,
                                        user: josephine
                                        )
new_prescription = Prescription.create!(description: "Maux de tête trop réguliers",
date: migraine_josephine.date_time,
appointment: migraine_josephine
)
file = URI.open('https://res.cloudinary.com/lewagonss/image/upload/v1648103208/MyNath/media_qua0i6.jpg')
new_prescription.document.attach(io: file, filename: 'prescription.png', content_type: 'document/jpg')

  #RDV 3 JO
insomnie_josephine = Appointment.create!(date_time: DateTime.new(2022, 3, 12, 10, 0),
                                      time: Time.new(2022, 4, 11, 10, 0),
                                      therapist: souraya,
                                      user: josephine
                                    )
new_prescription = Prescription.create!(description: "Problème d'insomnie",
                                    date: insomnie_josephine.date_time,
                                    appointment: insomnie_josephine
                                    )
file = URI.open('https://res.cloudinary.com/lewagonss/image/upload/v1648103208/MyNath/media_qua0i6.jpg')
new_prescription.document.attach(io: file, filename: 'prescription.png', content_type: 'document/jpg')

feedback_josephine = Feedback.create!(review_patient: "Je dors bien en début de nuit, mais je me reveille à 3h tous les jour.",
                                      date_time: DateTime.new(2022, 3, 17, 10, 0),
                                      appointment: insomnie_josephine
                                    )
feedback_souraya = Feedback.create!(review_therapist: "Super, c'est un bon progès. Voyons nous le 25 pour adapter le traitement.",
                                    date_time: DateTime.new(2022, 3, 18, 10, 0),
                                    appointment: insomnie_josephine
                                  )

#RDV 1 CLAIRE
panic_claire = Appointment.create!(date_time: DateTime.new(2022, 3, 17, 10, 0),
                                      time: Time.new(2022, 3, 17, 10, 0),
                                      therapist: souraya,
                                      user: claire
                                    )
new_prescription = Prescription.create!(description: "Panique attaque.",
                                    date: panic_claire.date_time,
                                    appointment: panic_claire
                                    )
file = URI.open('https://res.cloudinary.com/lewagonss/image/upload/v1648107397/MyNath/Sample-prescription-used-as-input-to-the-GUI-developed-in-the-present-work_lgupcx.png')
new_prescription.document.attach(io: file, filename: 'prescription.png', content_type: 'document/jpg')

feedback_claire = Feedback.create!(review_patient: "Merci Souraya, j'ai moins de crise, je suis soulagée.",
                                      date_time: DateTime.new(2022, 3, 17, 10, 0),
                                      appointment: panic_claire
                                    )
feedback_souraya = Feedback.create!(review_therapist: "Top, je suis ravie de l'apprendre, a bientôt",
                                    date_time: DateTime.new(2022, 3, 18, 10, 0),
                                    appointment: panic_claire
                                  )

#RDV 1 ANTOINE
parole_antoine = Appointment.create!(date_time: DateTime.new(2022, 3, 14, 10, 0),
time: Time.new(2022, 3, 14, 10, 0),
therapist: souraya,
user: antoine
)
new_prescription = Prescription.create!(description: "Problème de prise de parole en publique.",
date: parole_antoine.date_time,
appointment: parole_antoine
)
file = URI.open('https://res.cloudinary.com/lewagonss/image/upload/v1648107397/MyNath/Sample-prescription-used-as-input-to-the-GUI-developed-in-the-present-work_lgupcx.png')
new_prescription.document.attach(io: file, filename: 'prescription.png', content_type: 'document/jpg')

feedback_antoine = Feedback.create!(review_patient: "J'ai réussi à prendre la parole avec mon groupe d'ami.",
                                    date_time: DateTime.new(2022, 3, 17, 10, 0),
                                    appointment: parole_antoine
                                    )
feedback_souraya = Feedback.create!(review_therapist: "C'est super, deuxieme exercice, va a la boulangerie, demande un gâteau puis refuse.",
                                    date_time: DateTime.new(2022, 3, 18, 10, 0),
                                    appointment: parole_antoine
                                    )
feedback_antoine_2 = Feedback.create!(review_patient: "J'y suis allé mais impossible de refuser ma commande.",
                                      date_time: DateTime.new(2022, 3, 17, 10, 0),
                                      appointment: parole_antoine
                                      )
feedback_souraya_2 = Feedback.create!(review_therapist: "Recommencez au supermarché du coin.",
                                      date_time: DateTime.new(2022, 3, 18, 10, 0),
                                      appointment: parole_antoine
                                      )
feedback_antoine_3 = Feedback.create!(review_patient: "C'est bon, j'ai réussi cette fois ci !",
                                        date_time: DateTime.new(2022, 3, 17, 10, 0),
                                        appointment: parole_antoine
                                        )
feedback_souraya_3 = Feedback.create!(review_therapist: "Super bravo ! La suite : organisez une rencontre entre amis et racontez leur votre formation au Wagon.",
                                        date_time: DateTime.new(2022, 3, 18, 10, 0),
                                        appointment: parole_antoine
                                        )
 #RDV 4 JO
 hormone_josephine = Appointment.create!(date_time: DateTime.new(2022, 3, 25, 15, 0),
 time: Time.new(2022, 3, 25, 15, 0),
 therapist: myriam,
 user: josephine
)
