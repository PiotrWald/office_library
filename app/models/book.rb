class Book < ApplicationRecord
	has_many :orders
	
	validates_presence_of :title, :number_of_copies
end
