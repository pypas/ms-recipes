# frozen_string_literal: true

require 'sinatra'
require_relative 'services/contentful_service'
require_relative 'helper/markdown_helper'


get '/' do
  @title = "Marley Spoon Recipes"
    @recipes = ContentfulService.get_entries('recipe')
  erb :all_recipes
end

get '/:id' do
    @title = "Recipe Detail"
  @recipe = ContentfulService.get_entry(params['id'])
  erb :detail_recipe
end
