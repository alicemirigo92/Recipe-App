class RecipeFoodsController < ApplicationController
  def index
    @recipes = current_user.recipes.all
    @recipe_foods = RecipeFood.all
    @user = current_user
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @user = current_user
    @recipe = RecipeFood.new
  end

  def create
    quantity = params[:quantity]
    food = Food.find(params[:food_id])
    recipe = Recipe.find(params[:recipe_id]) 
  
    @recipe_food = RecipeFood.new(quantity:quantity, food_id: food.id, recipe_id: recipe.id)
    @recipe_food.recipe_id = recipe.id
    if @recipe_food.save
      flash.now[:success] = 'Recipe successfully created'
      redirect_to recipe_path(recipe.id)
    else
      flash[:error] = 'Error: Recipe not created'
      redirect_to new_recipe_path(@recipe.user)
    end
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update(public: !recipe.public)

    redirect_to recipe_path(recipe.id), notice: "The recipe is now #{recipe.public ? 'public' : 'private'}!"
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    if @recipe&.destroy
      redirect_to recipes_path, notice: 'Recipe successfully deleted!'
    else
      render 'new', notice: 'Something went wrong!'
    end
  end

  private
  def post_params
    params.require(:recipe).permit(:quantity, :food_id)
  end
end
