#encoding: utf-8
module FacebookHelper

    require 'koala'

    def fb_user(fb_id)
        new_graph
        @graph.get_object(fb_id)
    end

    def fb_users(fb_ids)
        new_graph
        @graph.get_objects(fb_ids)
    end

    def fb_picture(fb_id)
        new_graph
        @graph.get_picture(fb_id)
    end

    def fb_likes(fb_id)
        new_graph
        @graph.get_connections(fb_id, "likes")
    end

    private
        def new_graph
            @graph = Koala::Facebook::API.new(Facebook::TOKEN.to_s)
        end

end