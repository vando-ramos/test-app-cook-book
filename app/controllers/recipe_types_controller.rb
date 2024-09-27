class RecipeTypesController < ApplicationController
  before_action :set_recipe_type, only: %i[show edit update destroy]

  def new
    @recipe_type = RecipeType.new
  end

  def create
    @recipe_type = RecipeType.new(recipe_type_params)

    if @recipe_type.save
      redirect_to root_path, notice: 'Tipo de receita cadastrada com sucesso!'
    else
      flash.now.notice = 'Não foi possível cadastrar tipo de receita!'
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @recipe_type.update(recipe_type_params)
      redirect_to root_path, notice: 'Tipo de receita atualizada com sucesso!'
    else
      flash.now.notice = 'Não foi possível atualizar o tipo de receita!'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe_type.destroy
    redirect_to root_path, notice: 'Tipo de receita deletada com sucesso!'
  end

  private

  def recipe_type_params
    params.require(:recipe_type).permit(:name)
  end

  def set_recipe_type
    @recipe_type = RecipeType.find(params[:id])
  end
end
