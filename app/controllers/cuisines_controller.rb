class CuisinesController < ApplicationController
  def show
    @cuisine = Cuisine.find(params[:id])
    @recipe = Recipe.where(:cuisine => params[:id])
  end
end
