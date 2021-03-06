class RecipeTypesController < ApplicationController
  def show
    @recipe_types = RecipeType.find(params[:id])
    @recipe = Recipe.where(:recipe_type => params[:id])
  end
  def new
    @recipe_type = RecipeType.new
  end

  def create
    recipe_type_name = params.require(:recipe_type).permit(:name)
    @recipe_type = RecipeType.new(recipe_type_name)

    if @recipe_type.save
      redirect_to @recipe_type
    else
      render :new
    end
  end

  def edit
    @recipe_type = RecipeType.find(params[:id])
  end

  def update
    recipe_type_name = params.require(:recipe_type).permit(:name)
    @recipe_type = RecipeType.find(params[:id])
    if @recipe_type.update(recipe_type_name)
      redirect_to @recipe_type
    else
      render 'edit'
    end
  end
end
