class User < ApplicationRecord
  belongs_to :airplane_class
  belongs_to :flight
end
