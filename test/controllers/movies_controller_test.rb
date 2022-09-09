require "test_helper"

class MoviesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movie = movies(:one)
  end

  test "should get index" do
    get movies_url, as: :json
    assert_response :success
  end

  test "should create movie" do
    assert_difference("Movie.count") do
      post movies_url, params: { movie: { description: @movie.description, dislike: @movie.dislike, genre: @movie.genre, genre_id: @movie.genre_id, image_url: @movie.image_url, like: @movie.like, release_date: @movie.release_date, title: @movie.title, user_id: @movie.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show movie" do
    get movie_url(@movie), as: :json
    assert_response :success
  end

  test "should update movie" do
    patch movie_url(@movie), params: { movie: { description: @movie.description, dislike: @movie.dislike, genre: @movie.genre, genre_id: @movie.genre_id, image_url: @movie.image_url, like: @movie.like, release_date: @movie.release_date, title: @movie.title, user_id: @movie.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy movie" do
    assert_difference("Movie.count", -1) do
      delete movie_url(@movie), as: :json
    end

    assert_response :no_content
  end
end
