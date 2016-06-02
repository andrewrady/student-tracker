class Student < ActiveRecord::Base
	belongs_to :user

	extend FriendlyId
	friendly_id :name, use: :slugged

	def self.search(search)
	  where('name LIKE ?', "%#{search}%")
	end
end
