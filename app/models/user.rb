class User < ApplicationRecord
	belongs_to :role

	def has_role?(role)
		self.role.name == role
	end
end
