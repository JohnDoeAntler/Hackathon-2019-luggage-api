class Airplane < ApplicationRecord
	has_many :flights
	has_many :airplane_classes
end
