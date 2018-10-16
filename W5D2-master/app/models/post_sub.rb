class PostSub < ApplicationRecord
  
  #joins table 
  #somemore associations
  belongs_to :sub,
  foreign_key: :sub_id,
  class_name: :Sub 
  
  belongs_to :post, 
  foreign_key: :post_id,
  class_name: :Post
end
