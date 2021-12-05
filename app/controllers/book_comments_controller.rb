class BookCommentsController < ApplicationController


  def create
    @book = Book.find(params[:book_id])
    @comment = current_user.book_comments.new(book_comment_params)
    @comment.book_id = @book.id
    @comment.save
    @user = @book.user
    @book_comment = BookComment.new

    # redirect_to book_path(@book)
    # else
    # redirect_to book_path(@book)
  end

  def destroy
    BookComment.find_by(id: params[:id]).destroy
    @book = Book.find(params[:book_id])
    @user = @book.user
    # redirect_to book_path(params[:book_id])
  end

   private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
