class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @recipes = Recipe.all
  	erb :index
  end

  get '/recipes/new' do
    erb :new
  end
   
  post '/recipes' do
    @new_item = Recipe.create(params)
    redirect to "/recipes/#{@new_item.id}"
  end

  get '/recipes/:id' do
     @recipes = Recipe.find(params[:id])
     erb :recipe
  end

  get '/recipes/:id/edit' do
    @recipes = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @new_item = Recipe.update(params)
    redirect to "/recipes/#{@new_item.id}"
  end
  
  delete '/recipes/:id' do
    Recipe.destroy(params[:id])
  end
  # code actions here!

end
