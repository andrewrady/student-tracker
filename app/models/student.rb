class Student < ActiveRecord::Base
	belongs_to :user
	belongs_to :head_of_house
	has_many :transactions

	extend FriendlyId
	friendly_id :name, use: :slugged

	def self.search(search)
	  where('name LIKE ?', "%#{search}%")
	end
end
