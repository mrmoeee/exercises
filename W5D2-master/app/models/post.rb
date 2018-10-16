class Post < ApplicationRecord
  
  validates :title, presence: true 
  validates :subs, length: { minimum: 1 }
  belongs_to :author,
  foreign_key: :user_id,
  class_name: :User
  
  has_many :post_subs,
  foreign_key: :post_id,
  class_name: :PostSub,
  inverse_of: :post
  
  has_many :subs,
  through: :post_subs,
  source: :sub
end
# 
# A Post should consist of:
# 
# A title attribute (required)
# A url attribute (optional)
# A content attribute for content text (optional)
# A sub association to the Sub the Post is submitted to (required)
# An author association.
# 
