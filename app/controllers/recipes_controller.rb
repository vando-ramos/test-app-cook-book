class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  def show

  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe, notice: 'Receita cadastrada com sucesso!'
    else
      flash.now.notice = 'Não foi possível cadastrar receita!'
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'Receita atualizada com sucesso!'
    else
      flash.now.notice = 'Não foi possível atualizar receita!'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe.destroy
    redirect_to root_path, notice: 'Receita deletada com sucesso!'
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :recipe_type_id, :cuisine, :ingredients, :cook_method, :cook_time)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
