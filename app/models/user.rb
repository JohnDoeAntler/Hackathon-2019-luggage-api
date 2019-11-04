class User < ApplicationRecord
  belongs_to :airplane_class
  belongs_to :flight

  has_many :luggages
	has_many :purchase_logs
end
