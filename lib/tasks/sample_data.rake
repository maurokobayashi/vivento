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

        user_mauro = User.create!(
            email: "mauro.kobayashi@gmail.com",
            password: "rtg32oue",
            password_confirmation: "rtg32oue",
            condo_id: condo.id,
            facebook_id: 1486396431
        )
        user_mauro.toggle!(:admin)

        person_mauro = Person.create!(
            name: "Mauro Kobayashi",
            cpf: "340.570.298-42",
            birthdate: Date.new(1986, 4, 29),
            gender: "M",
            phone_area_code: "11",
            phone_number: "98045-6449",
            apartment_id: apartment.id,
            user_id: user_mauro.id
        )

        user_danillo = User.create!(
            email: "danillo.fs@gmail.com",
            password: "rtg32oue",
            password_confirmation: "rtg32oue",
            condo_id: condo.id,
            facebook_id:100000328568016
        )
        user_danillo.toggle!(:admin)

        person_danillo = Person.create!(
            name: "Danillo Souza",
            cpf: "340.570.298-43",
            birthdate: Date.new(1986, 4, 29),
            gender: "M",
            phone_area_code: "11",
            phone_number: "98045-6449",
            apartment_id: apartment.id,
            user_id: user_danillo.id
        )

        50.times do |n|

            apto = n+10
            gender = (n.modulo(2) == 0) ? 'M' : 'F'

            apartment = Apartment.create!(
                number: "#{apto}",
                floor: apto/10,
                building_id: building.id
            )

            user = User.create!(
                email: "fulano#{n+1}@gmail.com",
                password: "rtg32oue",
                password_confirmation: "rtg32oue",
                condo_id: condo.id,
                facebook_id: 1486396431
            )

            person = Person.create!(
                name: "Fulano Testador #{n+1}",
                cpf: "340.570.298-#{n+1}",
                birthdate: Date.new(1950+n+1, 1, 1),
                gender: gender,
                phone_area_code: "11",
                phone_number: "980#{n+1}-1111",
                apartment_id: apartment.id,
                user_id: user.id
            )

        end
    end
end