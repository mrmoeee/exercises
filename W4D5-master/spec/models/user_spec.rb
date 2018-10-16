# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'validations' do 
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
  end
  
  describe '::find_by_credentials' do 
    it 'should find a user by find_by_credentials' do 
      user = User.create(username: "John", email: "johnnn", password: "shortboii")
      found = User.find_by_credentials("John", "shortboii")
      expect(found).to eq(user)
    end 
  end
end
