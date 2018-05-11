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

4. Add User resouce, use devise
	- install devise
	- generate user and migrate
	- write tests for user creation

5. Add order resource
	- generate
	- add associacion to both user and book
	- add type open/closed
	- migrate
	- write tests
	- push to heroku

6. Make button for lending a book
	- add orders to be displayed under the book
	- create order create action in order conroller
	- add button that creates an order for the book in order controller

7. Add google log in feature

8. Only logged in users can do stuff

9. Frontend
	- prityfiy

