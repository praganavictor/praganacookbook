class RecipetypesController < ApplicationController
  def show
    @recipe_types = RecipeType.find(params[:id])
    @recipe = Recipe.where(:recipe_type => params[:id])
  end
end
