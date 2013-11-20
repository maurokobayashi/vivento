# == Schema Information
#
# Table name: facebook_accounts
#
#  id           :integer          not null, primary key
#  facebook_id  :integer
#  access_token :string(255)
#  user_id      :integer          not null
#

class FacebookAccount < ActiveRecord::Base

    belongs_to :user

    validates :facebook_id,
    :uniqueness => true,
    :unless => :you_are_mauro_or_danillo

    private
        def you_are_mauro_or_danillo
            facebook_id == 1486396431 || facebook_id == 100000328568016
        end
end