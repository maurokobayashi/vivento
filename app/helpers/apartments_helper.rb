#encoding: utf-8
module ApartmentsHelper

    def to_floors_select(floor_qty=50)
        floors = []

        floors << ['Térreo', 0]
        for i in 1..floor_qty
           floors << ["#{i}º andar", i]
        end

        floors
    end
end
