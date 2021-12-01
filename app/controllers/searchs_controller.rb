class SearchsController < ApplicationController

  def search
    @model = params["model"]
    @method = params["method"]
    @content = params["content"]
    @records = search_for(@model, @content, @method)
  end



   private
  def search_for(model, content, method)
    if model == 'user'
      if method == 'perfect'
        User.where(name: content)
      elsif method == "forward_match"
        User.where("name LIKE?",'%'+content+'%')
      elsif method == "backward_match"
        User.where("name LIKE?",'%'+content+'%')
      elsif method == "partial_match"
        User.where('name LIKE ?', '%'+content+'%')
      else
        User.all
      end

    else

    if model == 'book'
      if method == "perfect"
        Book.where(title: content)
      elsif method == "forward_match"
        Book.where("title LIKE?",'%'+content+'%')
      elsif method == "backward_match"
        Book.where("title LIKE?",'%'+content+'%')
      elsif method == "partial_match"
        Book.where('title LIKE ?', '%'+content+'%')
      else
        Book.all
      end
    end
    end
  end
end

