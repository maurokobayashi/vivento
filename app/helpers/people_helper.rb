#encoding: utf-8
module PeopleHelper

    def to_genders_select()
        genders = []
        genders << ['Masculino', 'M']
        genders << ['Feminino', 'F']
        genders
    end

    # Returns the Gravatar (http://gravatar.com/) for the given person.
    def gravatar_for(person, size=80)
        gravatar_id = Digest::MD5::hexdigest(person.email.downcase)
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?size=#{size}"
        image_tag(gravatar_url, class: "gravatar")
    end

    def avatar_for(person, size=200)
        if person.picture?
            image_tag @person.picture_url(:thumb), :width => size
        else
            image_tag 'avatar.jpg', :size => "#{size}x#{size}"
        end
    end

    def fill_with_facebook(person)
        fb = fb_user(current_user.facebook_id, [:name,:gender])
        person.name = fb['name']
        person.gender = fb['gender'] == 'male' ? 'M' : 'F'
    end

    def fill_with_vivento(person)
        person.email = current_user.email
    end

end
