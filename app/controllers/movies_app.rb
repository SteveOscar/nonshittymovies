class MoviesApp < Sinatra::Base
  get '/' do
    erb :dashboard
  end

  get '/new' do
    @movies = GetMovies.new("new")
    erb :new
  end

  get '/all' do
    @movies = GetMovies.new("all")
    erb :all
  end

  get '/info' do
    erb :info
  end

  not_found do
    erb :error
  end
end
