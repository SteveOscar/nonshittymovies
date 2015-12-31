class MoviesApp < Sinatra::Base

  get '/' do
    erb :dashboard
  end

  get '/new' do
    list = List.new
    @movies = list.best_in_theaters
    erb :new
  end

  get '/all' do
    list = List.new
    @movies = list.best_new_release
    erb :all
  end

  not_found do
    erb :error
  end
end
