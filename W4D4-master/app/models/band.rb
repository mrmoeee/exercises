class Band < ApplicationRecord
  validates :name, :genre, presence: true

end
