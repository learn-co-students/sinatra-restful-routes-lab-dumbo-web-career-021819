require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  #CREATE
  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do #creates new model instance
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end
  #READ
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do #CONTAINS PART OF DELETE
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end
  #UPDATE
  get '/recipes/:id/edit' do #load edit form
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do #edit action
    params.delete("_method")
    @recipe = Recipe.find(params[:id])
    @recipe.update(params)
    redirect to "/recipes/#{@recipe.id}"

    #can also rework params hash as nested
  end

  #DELETE
  delete '/recipes/:id' do #delete action
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.destroy
    erb :index
  end
end
