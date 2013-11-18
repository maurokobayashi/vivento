#encoding: utf-8
#namespace :db do
#     desc "Fill database with sample data"
#     task populate: :environment do

#         condo = Condo.create!(
#             code: "parcdesprinces",
#             name: "Condomínio Parc des Princes",
#             website: "http://www.parcdesprinces.com.br"
#         )

#         address = Address.create!(
#             street: "Rua Mandiçununga",
#             number: "570",
#             complement: "",
#             district: "Vila Sônia",
#             city: "São Paulo",
#             state: "SP",
#             country: "Brasil",
#             zipcode: "05619010",
#             condo_id: condo.id
#         )

#         building = Building.create!(
#             name: "Bloco A",
#             floor_qty: 20,
#             condo_id: condo.id
#         )

#         building2 = Building.create!(
#             name: "Bloco B",
#             floor_qty: 20,
#             condo_id: condo.id
#         )

#         communication1 = Communication.create!(
#             subject: "Manutenção na piscina",
#             message: "Na próxima segunda-feira (25/03) será realizada a manutenção mensal na piscina do bloco A. A mesma permanecerá fechada o dia todo. Essa manutenção é preventiva e visa atestar o correto funcionamento dos equipamentos, assim como aumentar sua vida útil. Os funcionários da empresa 'AcquaTech', responsável pelo serviço, circularão credenciados pelo térreo do bloco A. Obrigado pela compreensão, Mauro Kobayashi (Síndico).",
#             begin_date: Time.now,
#             expiration_date: Time.now
#         )

#         building_communication1 = BuildingCommunication.create!(
#             building: building,
#             communication: communication1
#         )

#         communication2 = Communication.create!(
#             subject: "Festa de 8 anos do condomínio",
#             message: "Amigos. É com muita alegria que anunciamos a festa de comemoração do aniversário de 8 anos do nosso condomínio. Teremos churrasco, música, animação e sorteios de brindes. Data: 26/05 a partir das 12:00hs. Local: Salão de festas do bloco A. Obrigado, Mauro Kobayashi (Síndico).",
#             begin_date: Time.now,
#             expiration_date: Time.now
#         )

#         building_communication2 = BuildingCommunication.create!(
#             building: building,
#             communication: communication2
#         )

#         apartment = Apartment.create!(
#             number: "100",
#             floor: 10,
#             building_id: building.id
#         )

#         #mauro
#         vivento_user_mauro = User.create!(
#             condo_id: condo.id
#         )
#         vivento_user_mauro.toggle!(:admin)
#         vivento_account_mauro = ViventoAccount.create!(
#             email: "mauro.kobayashi@gmail.com",
#             password: "rtg32oue",
#             password_confirmation: "rtg32oue",
#             user_id: vivento_user_mauro.id
#         )
#         vivento_person_mauro = Person.create!(
#             name: "Mauro Kobayashi",
#             email: vivento_account_mauro.email,
#             apartment_id: apartment.id,
#             user_id: vivento_user_mauro.id
#         )

#         #facebook user
#         # facebook_user_mauro = User.create!(
#         #     condo_id: condo.id
#         # )
#         # facebook_account_mauro = FacebookAccount.create!(
#         #     facebook_id: 1486396431,
#         #     user_id: facebook_user_mauro.id
#         # )
#         # facebook_person_mauro = Person.create!(
#         #     name: "Mauro Kobayashi",
#         #     email: "mauro.kobayashi@gmail.com",
#         #     apartment_id: apartment.id,
#         #     user_id: facebook_user_mauro.id
#         # )

#         #danillo
#         vivento_user_danillo = User.create!(
#             condo_id: condo.id
#         )
#         vivento_user_danillo.toggle!(:admin)
#         vivento_account_danillo = ViventoAccount.create!(
#             email: "danillo.fs@gmail.com",
#             password: "rtg32oue",
#             password_confirmation: "rtg32oue",
#             user_id: vivento_user_danillo.id
#         )
#         vivento_person_danillo = Person.create!(
#             name: "Danillo Souza",
#             email: "danillo.fs@gmail.com",
#             apartment_id: apartment.id,
#             user_id: vivento_user_danillo.id
#         )

#         20.times do |n|

#             apto = n+10

#             apartment = Apartment.create!(
#                 number: "#{apto}",
#                 floor: apto/10,
#                 building_id: building.id
#             )

#             user = User.create!(
#                 condo_id: condo.id
#             )

#             account = ViventoAccount.create!(
#                 email: "fulano#{n+1}@gmail.com",
#                 password: "rtg32oue",
#                 password_confirmation: "rtg32oue",
#                 user_id: user.id
#             )

#             person = Person.create!(
#                 name: "Fulano Testador #{n+1}",
#                 email: account.email,
#                 apartment_id: apartment.id,
#                 user_id: user.id
#             )

#         end
#     end
# end