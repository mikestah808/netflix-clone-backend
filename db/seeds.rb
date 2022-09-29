# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

michael = User.create(email: "michaelstafford808@gmail.com", password: "testpassword", first_name: "michael", last_name: "stafford")

genre_1 = Genre.create(id: 1, name: "comedy")
genre_2 = Genre.create(id: 2, name: "action")
genre_3 = Genre.create(id: 3, name: "drama")


movie_1 = Movie.create(user_id: 11, genre_id: 1, title: "test movie 1" , description: "its about comedy" , image_url: "https://cdn-images-1.medium.com/max/1600/1*05p0HXx8HN7Lyj2_RO_nFQ.jpeg" , release_date: 2000)
movie_2 = Movie.create(user_id: 11, genre_id: 2, title: "test movie 2" , description: "its about action" , image_url: "https://m.media-amazon.com/images/M/MV5BOTdkNGY5YjItOWU5OC00NTA0LTkxMGEtZDRlNWZmMmI2ZGZmXkEyXkFqcGdeQXVyODIwMDI1NjM@._V1_.jpg" , release_date: 2005)
movie_3 = Movie.create(user_id: 11, genre_id: 3, title: "test movie 3" , description: "its about drama" , image_url: "https://goodmovieslist.com/best-movies/movie-posters/tt0111161.jpg" , release_date: 1994)

