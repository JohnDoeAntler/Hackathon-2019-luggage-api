class Staff < ApplicationRecord
	has_secure_password

	enum role: [:administrator, :manager, :counter]
end
