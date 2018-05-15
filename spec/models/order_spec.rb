require 'rails_helper'

describe 'creation' do

	before(:each) do
    	@user = User.create()
		@book = Book.create(title: 'Star Wars', number_of_copies: 1)
		@order = Order.create(user_id: @user.id, book_id: @book.id)
  	end

	it 'should be successfully created' do
		expect(@order.persisted?).to be true
	end

	it 'should reference book' do
		expect(@order.user.id).to eq(@user.id)
	end

	it 'should reference user' do
		expect(@order.book.id).to eq(@book.id)
	end
end