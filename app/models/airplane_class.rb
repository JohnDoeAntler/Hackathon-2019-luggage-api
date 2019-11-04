class AirplaneClass < ApplicationRecord
  enum cot: [:business, :standard, :economic, :first_class]

  belongs_to :airplane

  has_many :users
end
