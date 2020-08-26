class BooksController < ApplicationController

	def top
	end

	def index
	  @books = Book.all
	  @book = Book.new
	end

	def create
	  @book = Book.new(book_params)
	  if @book.save
	  	redirect_to book_path(@book.id), notice: "Book was successfully created." # => Routing => Controller => View(show.html.erb)
	  else
	  	@books = Book.all
	  	render :index # => View(index.html.erb)
	  end
	end

	def show
	  @book = Book.find(params[:id])

	end

	def edit
	  @book = Book.find(params[:id])
	end

	def update
	  @book = Book.find(params[:id])
	  if @book.update(book_params)
	  	redirect_to book_path(@book.id), notice: "Book was successfully created."  # => Routing => Controller => View(show.html.erb)
	  else
	  	render :edit # => View(edit.html.erb)
	  end
	end

	def destroy
	  book = Book.find(params[:id])
	  book.destroy
	  redirect_to books_path
	end


	private
	def book_params
	  params.require(:book).permit(:title, :body)
	end

end
