# == Schema Information
#
# Table name: communications
#
#  id              :integer          not null, primary key
#  subject         :string(255)
#  message         :string(255)
#  begin_date      :date
#  expiration_date :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'

describe Communication do
  pending "add some examples to (or delete) #{__FILE__}"
end
