class Book < ApplicationRecord
	has_many :orders
	
	validates_presence_of :title, :number_of_copies
	validates :number_of_copies, numericality: { greater_than: 0 }
end
