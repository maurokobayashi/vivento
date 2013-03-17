#encoding: utf-8
module PeopleHelper

    # Returns the Gravatar (http://gravatar.com/) for the given person.
    def gravatar_for(person, size=80)
        gravatar_id = Digest::MD5::hexdigest(person.email.downcase)
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?size=#{size}"
        image_tag(gravatar_url, class: "gravatar")
    end

    def avatar_for_current_user(size=200)
        user = current_user
        if user.has_facebook_account?
            image_tag fb_picture(user.facebook_id, size)
        else
            person = user.person
            if person && person.picture?
                image_tag person.picture_url(:thumb), :width => size
            else
                image_tag 'avatar.jpg', :size => "#{size}x#{size}"
            end
        end
    end

    def avatar_for(person, size=200)
        if person.has_facebook_account?
            image_tag fb_picture(person.facebook_id, size)
        else
            if person.picture?
                image_tag person.picture_url(:thumb), :width => size
            else
                image_tag 'avatar.jpg', :size => "#{size}x#{size}"
            end
        end
    end

    def fill_with_facebook(person)
        # fb = fb_user(current_user.facebook_id, [:name,:email])
        fb = fb_user(current_user.facebook_account, [:name,:email])
        person.name = fb['name']
        person.email = fb['email']
    end

    def fill_with_vivento(person)
        person.email = current_user.vivento_account.email
    end

end
