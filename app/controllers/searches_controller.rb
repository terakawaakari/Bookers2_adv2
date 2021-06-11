class SearchesController < ApplicationController

  def search
    @range = params[:range]
    search = params[:search]
    word = params[:word]

    if @range == '1'
      @users = User.search(search,word)
      @groups = Group.where(owner_id: current_user.id)
    elsif @range == '2'
      @books = Book.search(search,word)
    else
      if search == "forward_match"
        @tags = Tag.where("tag_name LIKE?","#{word}%").first.id
      elsif search == "backward_match"
        @tags = Tag.where("tag_name LIKE?","%#{word}").first.id
      elsif search == "perfect_match"
        @tags = Tag.where("#{word}").first.id
      elsif search == "partial_match"
        @tags = Tag.where("tag_name LIKE?","%#{word}%").first.id
      else
        @tags = Tag.all
      end
      @tag_books = Tag.find(@tags).books
      @books = Book.page(params[:page]).reverse_order
    end
  end
end
