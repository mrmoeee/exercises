class Cat < ApplicationRecord
  COLORS = ["blue", "green", "yellow", "orange", "turqoise", "pink", "aqua"]
  
  validates :birth_date, presence: true 
  validates :color, :inclusion => { :in => COLORS }, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :sex, :inclusion => { :in => ["M", "F"] }, presence: true
  
  def age
    today = Date.today 
    (today - birth_date).div(365) 
  end
  
  
end 