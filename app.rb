# frozen_string_literal: true

require 'sinatra'
require_relative 'services/contentful_service'

get '/' do
  @recipes = ContentfulService.get_entries('recipe')
  erb :all_recipes
end

get '/:id' do
  @recipe = ContentfulService.get_entry(params['id'])
  erb :detail_recipe
end
