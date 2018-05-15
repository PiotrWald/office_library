class OrdersController < ApplicationController
	def create
		book = Book.find(order_params[:book_id])
		if (book.number_of_copies -= 1) >= 0
            Order.transaction do
        		book.save
        		make_order(book)
            end
    	else
    		redirect_to book, notice: 'Not enough copies of this book'
    	end
	end

	 def edit
    	@order = Order.find(params[:id])
    	@order.status = :closed

        ok = @order.transaction do
                	book = @order.book
                	book.number_of_copies += 1
                	book.save
                    @order.save
                end

    	if ok
    		redirect_to @order.book, notice:
    		"You have succesfully returned #{ @order.book.title }"
    	end
    end

    def index
        @orders = Order.where(user_id: current_user.id)
    end


	private

    def order_params
      params.require(:order).permit(:book_id)
    end

    def make_order book
    	if Order.create(
			user_id: current_user.id,
			book_id: book.id,
			status: :open
		)
			redirect_to book, notice: "You have succesfully borrowed #{book.title}!"
		end
	end
end
