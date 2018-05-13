class OrdersController < ApplicationController
	before_action :check_permission
	def create
		book = Book.find(order_params[:book_id])
		if (book.number_of_copies -= 1) >= 0
    		book.save
    		make_order(book)
    	else
    		redirect_to book, notice: 'Not enugh copes of this book'
    	end
	end

	 def edit
    	@order = Order.find(params[:id])
    	@order.status = :closed

    	book = @order.book
    	book.number_of_copies += 1
    	book.save

    	if @order.save
    		redirect_to @order.book, notice:
    		"You have succesfully returned #{ @order.book.title }"
    	end
    end


	private

    def order_params
      params.require(:order).permit(:book_id)
    end

    def check_permission
    	if current_user.nil?
    		redirect_to root_path, notice: 'You cannot do that'
    	end
    end

    def make_order book
    	if Order.create(
			user_id: current_user.id,
			book_id: book.id,
			status: :open
		)
			redirect_to book, notice: "You have succesfully borrowed #{book.title}!"
		else
			redirect_to books_path 'Your request can not be processed during this time'
		end
	end
end
