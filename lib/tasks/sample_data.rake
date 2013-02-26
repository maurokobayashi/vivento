#encoding: utf-8
namespace :db do
    desc "Fill database with sample data"
    task populate: :environment do

        address = Address.create!(
            street: "Rua Mandiçununga",
            number: "570",
            complement: "",
            district: "Vila Sônia",
            city: "São Paulo",
            state: "SP",
            country: "Brasil",
            zipcode: "05619010"
        )

        condo = Condo.create!(
            code: "parc-des-princes",
            name: "Condomínio Parc des Princes",
            website: "http://www.parcdesprinces.com.br",
            address_id: address.id
        )

        building = Building.create!(
            name: "Bloco A",
            floor_qty: 20,
            condo_id: condo.id
        )

        user_admin = User.create!(name: "Mauro Kobayashi",
            email: "mauro.kobayashi@gmail.com",
            cpf: "340.570.298-42",
            birthdate: Date.new(1986, 4, 29),
            phone_area_code: "11",
            phone_number: "98045-6449",
            password: "rtg32oue",
            password_confirmation: "rtg32oue",
            picture: "gravatar.jpeg",
            condo_id: condo.id
        )
        user_admin.toggle!(:admin)

        apartment_admin = Apartment.create!(
            number: "1",
            floor: 0,
            building_id: building.id,
            user_id: user_admin.id
        )

        user_admin2 = User.create!(
            name: "Danillo Souza",
            email: "danillo.fs@gmail.com",
            cpf: "340.570.298-43",
            birthdate: Date.new(1986, 4, 29),
            phone_area_code: "11",
            phone_number: "98045-6449",
            password: "rtg32oue",
            password_confirmation: "rtg32oue",
            condo_id: condo.id
        )
        user_admin2.toggle!(:admin)


        apartment_admin2 = Apartment.create!(
            number: "2",
            floor: 0,
            building_id: building.id,
            user_id: user_admin2.id
        )

        50.times do |n|

            user = User.create!(
                name: "Fulano Testador #{n+1}",
                email: "fulano#{n+1}@gmail.com",
                cpf: "340.570.298-#{n+1}",
                birthdate: Date.new(1950+n+1, 1, 1),
                phone_area_code: "11",
                phone_number: "980#{n+1}-1111",
                password: "rtg32oue",
                password_confirmation: "rtg32oue",
                condo_id: condo.id
            )

            apto = n+10
            Apartment.create!(
                number: "#{apto}",
                floor: apto/10,
                building_id: building.id,
                user_id: user.id
            )

        end
    end
end