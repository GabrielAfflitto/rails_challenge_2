class Book < ApplicationRecord
  has_many :reviews

  def average_rating
    reviews.average(:rating).to_i
  end

  def highest_rating
    reviews.order("rating DESC").first
  end

  def lowest_rating
    reviews.order("rating ASC").first
  end
end
