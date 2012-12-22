module UsersHelper

	# Returns the Gravatar (http://gravatar.com/) for the given user.
	def gravatar_for(user, size=80)
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?size=#{size}"
		image_tag(gravatar_url, class: "gravatar")
	end

    def format_phone(phone_area_code, phone_number)
        "(" + phone_area_code + ")" + " " + phone_number
    end
end