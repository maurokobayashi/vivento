#encoding: utf-8
module PeopleHelper

    def to_genders_select()
        genders = []
        genders << ['Masculino', 'M']
        genders << ['Feminino', 'F']
        genders
    end

end
