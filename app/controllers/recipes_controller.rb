class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
    
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build()
    @recipe.ingredients.build()
  end

  def create
    @recipe = Recipe.create(title: recipe_params[:title])
    recipe_attr_1 = recipe_params[:ingredients_attributes]["0"]
    recipe_attr_2 = recipe_params[:ingredients_attributes]["1"]

    recipe_1 = Ingredient.create(recipe_id: @recipe.id, name: recipe_attr_1[:name], quantity: recipe_attr_1[:quantity])
    recipe_2 = Ingredient.create(recipe_id: @recipe.id, name: recipe_attr_2[:name], quantity: recipe_attr_2[:quantity])
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :title, 
      ingredients_attributes: [
        :name, 
        :quantity
      ]
    )
  end 


end

