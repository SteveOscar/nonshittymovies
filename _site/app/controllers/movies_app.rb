class MoviesApp < Sinatra::Base

  get '/' do
    erb :dashboard
  end

  get '/new' do
    list = List.new
    @movie1 = list.best_new_release[0]
    @comment1 = list.comment(@movie1)
    @poster1 = list.fetch_poster(@movie1[:title])
    @movie2 = list.best_new_release[1]
    @comment2 = list.comment(@movie2)
    @poster2 = list.fetch_poster(@movie2[:title])
    @movie3 = list.best_new_release[2]
    @comment3 = list.comment(@movie3)
    @poster3 = list.fetch_poster(@movie3[:title])
    erb :new
  end

  get '/all' do
    list = List.new
    @movie1 = list.best_in_theaters[0]
    @comment1 = list.comment(@movie1)
    @poster1 = list.fetch_poster(@movie1[:title])
    @movie2 = list.best_in_theaters[1]
    @comment2 = list.comment(@movie2)
    @poster2 = list.fetch_poster(@movie2[:title])
    @movie3 = list.best_in_theaters[2]
    @comment3 = list.comment(@movie3)
    @poster3 = list.fetch_poster(@movie3[:title])
    erb :all
  end

  get '/info' do
    erb :info
  end

  not_found do
    erb :error
  end
end
