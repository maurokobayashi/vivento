#encoding: utf-8
module UsersHelper

    def last_logged_in(qty=12)

        last_logged_in = Person.joins(:user).where('users.condo_id' => current_condo).order('created_at DESC').limit(qty)
        img_size = 45

        html = ""
        last_logged_in.each do |person|
            html+= "<a href=/people/#{person.id}>"
            html+= "<span class='circle' style='position:relative; display:inline-block; background:url(#{avatar_circle_for person, img_size}) no-repeat center center; width: #{img_size}px; height: #{img_size}px;' />"
            html+= "</a>"
        end
        html.html_safe
    end

end