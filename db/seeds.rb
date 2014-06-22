# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

condo = Condo.create!(
  code: "parcdesprinces",
  name: "Condomínio Parc des Princes",
  website: "http://www.parcdesprinces.com.br"
)

building = Building.create!(name: "Bloco 1", floor_qty: 10, condo: condo)

(1..20).each do |apartment|
	Apartment.create!(number: apartment, floor: apartment/2, building: building)
end