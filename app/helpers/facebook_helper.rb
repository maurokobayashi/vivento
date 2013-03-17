#encoding: utf-8
module FacebookHelper

    require 'koala'

    def fb_user(fb_account,fields)
        new_graph_private fb_account.access_token
        fb = @graph.get_object(fb_account.facebook_id, :fields => fields.join(', '))
        puts "====================== #{fb}"
        fb
    end

    def fb_users(fb_ids)
        new_graph
        @graph.get_objects(fb_ids)
    end

    def fb_picture(fb_id, size=200)
        new_graph
        @graph.get_picture(fb_id, :width => size, :height => size)
    end

    def fb_likes(fb_id)
        new_graph_private
        @graph.get_connections(fb_id, "likes")
    end

    private
        def new_graph
            @graph = Koala::Facebook::API.new
        end

    private
        def new_graph_private(access_token)
            @graph = Koala::Facebook::API.new(access_token)
        end

end