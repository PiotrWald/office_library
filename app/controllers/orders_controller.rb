class OrdersController < ApplicationController
    before_action :get_order_manager

	def create
		book = Book.find(order_params[:book_id])

      if @order_manager.make_order(book)
        redirect_to book, notice: "You have succesfully borrowed #{book.title}!"
    	else
    		redirect_to book, alert: 'Not enough copies of this book'
    	end
	end

	def edit
    @order = Order.find(params[:id])

    if @order_manager.return_order(@order)
    	flash.notice = "You have succesfully returned #{ @order.book.title }"
    else 
      flash.alert = "Oops something went wrong"
    end

    redirect_to @order.book
    end

    def index
        @orders = Order.where(user_id: current_user.id)
    end

	private

    def order_params
      params.require(:order).permit(:book_id)
    end

    def get_order_manager
        @order_manager = OrderManagerService.new(current_user)
    end
end
