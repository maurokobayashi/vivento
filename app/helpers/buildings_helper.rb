#encoding: utf-8
module BuildingsHelper

    def to_floor_qty_select(floor_qty=50)
        floors = []

        for i in 1..floor_qty
           floors << [i, i]
        end

        floors
    end

end
