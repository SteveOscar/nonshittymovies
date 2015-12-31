class MoviesApp < Sinatra::Base

  get '/' do
    erb :dashboard
  end

  get '/new' do
    list = List.new
    @movies = list.best_new_release[0]
    @comment = list.comment(@movies)
    erb :new
  end

  get '/new/2' do
    list = List.new
    @movies = list.best_new_release[1]
    @comment = list.comment(@movies)
    erb :new2
  end

  get '/new/3' do
    list = List.new
    @movies = list.best_new_release[2]
    @comment = list.comment(@movies)
    erb :new3
  end

  get '/all' do
    list = List.new
    @movies = list.best_in_theaters[0]
    @comment = list.comment(@movies)
    erb :all
  end

  get '/all/2' do
    list = List.new
    @movies = list.best_in_theaters[1]
    @comment = list.comment(@movies)
    erb :all2
  end

  get '/all/3' do
    list = List.new
    @movies = list.best_in_theaters[2]
    @comment = list.comment(@movies)
    erb :all3
  end

  not_found do
    erb :error
  end
end
