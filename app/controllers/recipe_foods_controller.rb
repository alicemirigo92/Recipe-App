class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
    @foods = Food.all
    @recipe = Recipe.find(params[:recipe_id])
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recipe_id = params[:recipe_id]

    if @recipe_food.save
      redirect_to recipe_path(@recipe_food.recipe_id), notice: 'Recipe Food successfully added!'
    else
      render 'new', notice: 'Something went wrong!'
    end
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
    @foods = Food.all
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])

    if @recipe_food.update(recipe_food_params)
      redirect_to recipe_path(@recipe_food.recipe_id), notice: 'Recipe Food successfully updated!'
    else
      render 'edit', notice: 'Something went wrong!'
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy

    if @recipe_food&.destroy
      redirect_to recipe_path(@recipe_food.recipe_id), notice: 'Recipe Food successfully deleted!'
    else
      render 'new', notice: 'Something went wrong!'
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
end