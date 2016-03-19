class GetMovies
  attr_reader :movie1, :movie2, :movie3,
              :comment1, :comment2, :comment3,
              :poster1, :poster2, :poster3

  def initialize(for_page)
    @list = List.new
    @movies = get_movies(for_page)
    @comment1 = comment(@movies[0])
    @comment2 = comment(@movies[1])
    @comment3 = comment(@movies[2])
    @movie1 = @movies[0]
    @movie2 = @movies[1]
    @movie3 = @movies[2]
    @poster1 = poster(@movie1[:title])
    @poster2 = poster(@movie2[:title])
    @poster3 = poster(@movie3[:title])
  end

  def get_movies(for_page)
    movies = @list.best_new_release if for_page == "new"
    movies = @list.best_in_theaters if for_page == "all"
    movies
  end

  def comment(movie)
    @list.comment(movie)
  end

  def poster(title)
    @list.fetch_poster(title)
  end

end
