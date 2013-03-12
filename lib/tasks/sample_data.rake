#encoding: utf-8
namespace :db do
    desc "Fill database with sample data"
    task populate: :environment do

        condo = Condo.create!(
            code: "parc-des-princes",
            name: "Condomínio Parc des Princes",
            website: "http://www.parcdesprinces.com.br",
        )

        address = Address.create!(
            street: "Rua Mandiçununga",
            number: "570",
            complement: "",
            district: "Vila Sônia",
            city: "São Paulo",
            state: "SP",
            country: "Brasil",
            zipcode: "05619010",
            condo_id: condo.id
        )

        building = Building.create!(
            name: "Bloco A",
            floor_qty: 20,
            condo_id: condo.id
        )

        apartment = Apartment.create!(
            number: "100",
            floor: 10,
            building_id: building.id
        )

        #mauro
        #vivento user
        vivento_user_mauro = User.create!(
            condo_id: condo.id
        )
        vivento_user_mauro.toggle!(:admin)
        vivento_account_mauro = ViventoAccount.create!(
            email: "mauro.kobayashi@gmail.com",
            password: "rtg32oue",
            password_confirmation: "rtg32oue",
            user_id: vivento_user_mauro.id
        )
        vivento_person_mauro = Person.create!(
            name: "Mauro Kobayashi",
            email: vivento_account_mauro.email,
            gender: "M",
            apartment_id: apartment.id,
            user_id: vivento_user_mauro.id
        )

        #facebook user
        facebook_user_mauro = User.create!(
            condo_id: condo.id
        )
        facebook_account_mauro = FacebookAccount.create!(
            facebook_id: 1486396431,
            user_id: facebook_user_mauro.id
        )
        facebook_person_mauro = Person.create!(
            name: "Mauro Kobayashi",
            email: "mauro.kobayashi@gmail.com",
            gender: "M",
            apartment_id: apartment.id,
            user_id: facebook_user_mauro.id
        )

        #danillo
        #facebook user
        facebook_user_danillo = User.create!(
            condo_id: condo.id
        )
        facebook_user_danillo.toggle!(:admin)
        facebook_account_danillo = FacebookAccount.create!(
            facebook_id: 100000328568016,
            user_id: facebook_user_danillo.id
        )
        facebook_person_danillo = Person.create!(
            name: "Danillo Souza",
            email: "danillo.fs@gmail.com",
            gender: "M",
            apartment_id: apartment.id,
            user_id: facebook_user_danillo.id
        )

        20.times do |n|

            apto = n+10
            gender = (n.modulo(2) == 0) ? 'M' : 'F'

            apartment = Apartment.create!(
                number: "#{apto}",
                floor: apto/10,
                building_id: building.id
            )

            user = User.create!(
                condo_id: condo.id
            )

            account = ViventoAccount.create!(
                email: "fulano#{n+1}@gmail.com",
                password: "rtg32oue",
                password_confirmation: "rtg32oue",
                user_id: user.id
            )

            person = Person.create!(
                name: "Fulano Testador #{n+1}",
                email: account.email,
                gender: gender,
                apartment_id: apartment.id,
                user_id: user.id
            )

        end
    end
end