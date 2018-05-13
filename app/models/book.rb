class Book < ApplicationRecord
	has_many :orders
	
	validates :title, presence: true
end
