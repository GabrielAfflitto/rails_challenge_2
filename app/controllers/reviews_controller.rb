class ReviewsController < ApplicationController

  def create
    @book = Book.find(params[:book.id])
    @review = User.reviews.new(book_params)
    if @review.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

end
