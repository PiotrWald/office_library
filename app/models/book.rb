class Book < ApplicationRecord
	has_many :orders
	
	validates_presence_of :title, :number_of_copies
	validates :number_of_copies, numericality: { greater_than_or_equal_to: 0 }
	validates :title, length: { in: 1..20 }
end
