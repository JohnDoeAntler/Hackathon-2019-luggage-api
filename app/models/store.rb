class Store < ApplicationRecord
	has_secure_password
	has_many :purchase_logs
end
