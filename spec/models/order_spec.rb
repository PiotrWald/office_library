require 'rails_helper'

describe 'creation' do
	it 'should be successfully created' do
		user = User.create()
		book = Book.create(title: 'Star Wars')
		order = Order.create(user_id: user.id, book_id: book.id)
		expect(order.persisted?).to be true
	end

	it 'should reference book' do
		user = User.create()
		book = Book.create(title: 'Star Wars')
		order = Order.create(user_id: user.id, book_id: book.id)
		expect(order.user.id).to eq(user.id)
	end

	it 'should reference user' do
		user = User.create()
		book = Book.create(title: 'Star Wars')
		order = Order.create(user_id: user.id, book_id: book.id)
		expect(order.book.id).to eq(book.id)
	end
end