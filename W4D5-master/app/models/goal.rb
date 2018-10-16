# == Schema Information
#
# Table name: goals
#
#  id          :bigint(8)        not null, primary key
#  title       :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Goal < ApplicationRecord
  validates :title, :user_id, :completed, presence: true
  after_initialize :set_completed
  
  def set_completed
    self.completed = 'N'
  end
  
  def complete_goal
    self.completed = 'Y'
  end
end
