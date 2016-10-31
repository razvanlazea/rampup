class User < ApplicationRecord
	belongs_to :role

	validates_uniqueness_of :username
	validates_uniqueness_of :email
	validates_presence_of   :firstname
	validates_presence_of   :lastname
	validates_presence_of   :password

	before_create :set_password, :set_role

	def has_role?(role)
		if self.role
			self.role.name == role
		end
	end

	private

	def set_role
		self.role = Role.find_by_name("user")
	end

	def set_password
		key = Blowfish::Key.generate('123456')
  		pass = self.password
  		encrypted = Blowfish.encrypt(pass, key)
  		self.password = encrypted
	end
end
