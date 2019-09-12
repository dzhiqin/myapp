# == Schema Information
#
# Table name: profiles
#
#  id                :bigint           not null, primary key
#  user_id           :integer
#  name              :string(255)
#  birthday          :date
#  address           :string(255)
#  education         :string(255)
#  occupation        :string(255)
#  bref_introduction :text(65535)
#  remark            :text(65535)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Profile < ApplicationRecord
  belongs_to :user
end
