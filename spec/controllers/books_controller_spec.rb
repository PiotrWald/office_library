require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let(:valid_attributes) {{
    title: 'Lord of the Rings',
    description: 'History of brave Hobbits and the ring',
    number_of_copies: 1
  }}

  let(:invalid_attributes) {{
    title: nil,
    description: 'some description'
  }}

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a successful response" do
      book = Book.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a successful response" do
      book = Book.create! valid_attributes
      get :show, params: {id: book.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a successful response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a successful response" do
      book = Book.create! valid_attributes
      get :edit, params: {id: book.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Book" do
        expect {
          post :create, params: {book: valid_attributes}, session: valid_session
        }.to change(Book, :count).by(1)
      end

      it "redirects to the created book" do
        post :create, params: {book: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Book.last)
      end
    end

    context "with invalid params" do
      it "returns a successful response (i.e. to display the 'new' template)" do
        post :create, params: {book: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {{
        title: 'Game of Thrones',
        desription: 'Dragons!'
      }}

      it "redirects to the book" do
        book = Book.create! valid_attributes
        put :update, params: {id: book.to_param, book: valid_attributes}, session: valid_session
        expect(response).to redirect_to(book)
      end
    end

    context "with invalid params" do
      it "returns a successful response (i.e. to display the 'edit' template)" do
        book = Book.create! valid_attributes
        put :update, params: {id: book.to_param, book: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested book" do
      book = Book.create! valid_attributes
      expect {
        delete :destroy, params: {id: book.to_param}, session: valid_session
      }.to change(Book, :count).by(-1)
    end

    it "redirects to the books list" do
      book = Book.create! valid_attributes
      delete :destroy, params: {id: book.to_param}, session: valid_session
      expect(response).to redirect_to(books_url)
    end
  end

end
