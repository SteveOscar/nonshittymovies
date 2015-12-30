

class MoviesApp < Sinatra::Base
  get '/' do
    list = List.new
    @movies = list.fetch_movies
    erb :dashboard
  end

  # get '/tasks' do
  #   if params[:title]
  #     @tasks = TaskManager.find_by(title: params[:title])
  #   else
  #     @tasks = TaskManager.all
  #   end
  #   erb :index
  # end
  #
  # get '/tasks/new' do
  #   erb :new
  # end
  #
  # post '/tasks' do
  #   TaskManager.create(params[:task])
  #   redirect '/tasks'
  # end
  #
  # get '/tasks/:id' do |id|
  #   @task = TaskManager.find(id.to_i)
  #   erb :show
  # end
  #
  # get '/tasks/:id/edit' do |id|
  #   @task = TaskManager.find(id.to_i)
  #   erb :edit
  # end
  #
  # put '/tasks/:id' do |id|
  #   TaskManager.update(id.to_i, params[:task])
  #   redirect "/tasks/#{id}"
  # end
  #
  # delete '/tasks/:id' do |id|
  #   TaskManager.delete(id.to_i)
  #   redirect '/tasks'
  # end

  not_found do
    erb :error
  end
end
