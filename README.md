Zadanie: zrobienie biblioteczki firmowej, w ramach której możliwe jest:

- listowanie książek

- dodawanie, usuwanie, edycja książki,

- zobaczenie szczegółów ksiązki

- guzik do wypożyczenia i oddania ksiazki

- historia wypożyczeń

- logowanie za pomocą google account

- umieścić na Heroku, udostępnić kod na Github

1. App initial creation
	+ add pq gem to work on heroku
	+ create repo on github
	+ add bootstrap, jquery
	+ add rpsec
	+ deploy on heroku

2. Write initial tests
	+ check wheater site can be reached
	+ write tests for all routes for books
	+ chceck if book can be created/modified/viewed/destroyed/index

3. Add book resource
	+ generate and migrate
	+ create apropriate acitions in controler
	+ add a resource to routes
	+ create templates for added actions
	+ push to heroku

4. Add User resouce
	+ generate user and migrate
	+ write tests for user creation

5. Add order model
	+ generate
	+ add associacion to both user and book
	+ add status open/closed
	+ migrate
	+ write tests
	+ push to heroku

6. Make button for lending a book
	+ add orders to be displayed under the book if open
	+ create order create action in order conroller
	+ add button that creates an order for the book in order controller

8. Only logged in users can do stuff
	+ default

9. Frontend
	+ add bootstrap-rails to the project
	+ add striped table for the book list
	+ add navbar at the top
	+ make workable layout of books#show
	+ add button for adding new books
	- improve look of the new/update view
	- final polish

10. Make seeds to populate databse
	+ make book seeds

11. Add error handling

12. Refactor the code

13. Add history feature
	+ add controller action order#index
	+ create a view
	+ make view look semi-deecent

14. Decrease number of active record queries


    <% if ord = @orders.where(status: :open).count != 0 %>
      <%= form_for @order, url: { controller: "orders", action: "edit" } do |f| %>
      <%= f.hidden_field :id, value: ord.first.id %>
      <%= f.submit "Return This Book", class: "btn btn-success btn-lg"%>
    <% end %>
	    <%= link_to 'Edit', edit_book_path(@book), class: "btn btn-info btn-lg" %> 
	    <%= link_to 'Delete', @book, method: :delete, data: { confirm: 'Are you sure?' }, class: "btn btn-warning btn-lg", style: ""%>
  <% end %>