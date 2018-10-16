# == Schema Information
#
# Table name: visits
#
#  id           :bigint(8)        not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#  short_url_id :integer
#

class Visit < ApplicationRecord
  validates :user_id, :short_url_id, presence: true
  
  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
    
  belongs_to :shortened_url,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: :ShortenedUrl
  
    def self.record_visit!(user, shortened_url)
      
      Visit.create!(user_id: user, short_url_id: shortened_url)
    end
end
