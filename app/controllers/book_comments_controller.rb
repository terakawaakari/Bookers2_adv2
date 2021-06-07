class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.new
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = @book.id
    comment.save
    unless comment.save
      redirect_to book_path(book), alert: 'フォームにコメントを入力してください'
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.new
    comment = BookComment.find_by(id:params[:id], book_id:params[:book_id])
    comment.destroy
  end


  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end