class OrderManagerService

  def initialize user
    @user = user
  end

	def return_order order
		order.status = :closed
  	book = order.book
  	book.number_of_copies += 1

		order.transaction do
    	book.save
      order.save
	  end
  end


  def make_order book
  	return nil if book.number_of_copies <= 0

  	book.number_of_copies -= 1
  	order = Order.new(
			user_id: @user.id,
			book_id: book.id,
			status: :open
		)

  	order.transaction do
  		book.save
  		order.save
  	end	
	end
end