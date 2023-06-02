class RecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:user).where(user_id: current_user.id)
    @user = current_user
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods.includes(:food)
  end

  def new
    @user = current_user
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(post_params)
    @recipe.user = current_user
    if @recipe.save
      flash.now[:success] = 'Post successfully created'
      redirect_to recipes_path(current_user, @recipe)
    else
      flash[:error] = 'Error: Recipe not created'
      redirect_to new_recipe_path(@recipe.user)
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, notice: 'Recipe deleted'
  end

  private

  def post_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
  end
end
