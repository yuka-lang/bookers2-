class BooksController < ApplicationController
  before_action :current_user, only: [:edit]

  def show
    @book = Book.find(params[:id])
    @newbook = Book.new
    @user = @book.user
    @book_comment = BookComment.new
  end

  def index
    from  = Time.current.at_beginning_of_day
    to    = (from + 6.day).at_end_of_day
    books = Book.where(created_at: from...to)
    # ↑1週間分のデータ取得
    @book = Book.new
    @books = Book.includes(:favorited_users).sort {|a,b| b.favorited_users.size <=> a.favorited_users.size}
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path
    end
  end



  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body , :user_id)
  end

end
