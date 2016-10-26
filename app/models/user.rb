class User < ApplicationRecord
	belongs_to :role

	def has_role?(role)
		if self.role
			self.role.name == role
		end
	end
end
