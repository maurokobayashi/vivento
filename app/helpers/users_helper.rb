#encoding: utf-8
module UsersHelper

	# Returns the Gravatar (http://gravatar.com/) for the given user.
	def gravatar_for(user, size=80)
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?size=#{size}"
		image_tag(gravatar_url, class: "gravatar")
	end

    def avatar_for(user, size=200)
        if user.picture?
            image_tag @user.picture_url(:thumb), :width => size
        else
            image_tag 'avatar.jpg', :size => "#{size}x#{size}"
        end
    end

end