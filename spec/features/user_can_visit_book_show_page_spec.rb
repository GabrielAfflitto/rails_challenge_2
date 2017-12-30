require 'rails_helper'


describe "when a user visits the book show page" do
  before(:each) do
    @book = Book.create!(title: "Harry Potter")
    @user = User.create!(name: "Gabe")
    @review = @user.reviews.create!(body: "This book was great", rating: 5, book: @book)
    @user2 = User.create!(name: "Jim")
    @review2 = @user2.reviews.create!(body: "This book sucked", rating: 1, book: @book)
    visit book_path(@book)
  end

  it "should list the book title along with review information" do

    expect(page).to have_content("Harry Potter")
    expect(page).to have_content("This book was great")
    expect(page).to have_content(5)
    expect(page).to have_content("Jim")
    expect(page).to have_content("This book sucked")
    expect(page).to have_content(1)
  end

  it "should present the average rating for the book" do
    expect(page).to have_content("Average Rating: 3")
  end

  it "should include a header that shows the highest rating for the book" do
    within ".highest_rating" do
      expect(page).to have_content("Highest Rating: 5")
      expect(page).to have_content("This book was great")
      expect(page).to have_content("Gabe")
    end
  end

  it "should include a header that shows the lowest rating for the book" do
    within ".lowest_rating" do
      expect(page).to have_content("Lowest Rating: 1")
      expect(page).to have_content("This book sucked")
      expect(page).to have_content(1)
    end
  end
end
