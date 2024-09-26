class RecipeTypesController < ApplicationController
  def new
    @recipe_type = RecipeType.new
  end

  def create
    @recipe_type = RecipeType.new(recipe_type_params)

    if @recipe_type.save
      redirect_to root_path, notice: 'Tipo de Receita criada com sucesso!'
    else
      flash.now.notice = 'Não possível criar tipo de Receita!'
      render :new
    end
  end

  private

  def recipe_type_params
    params.require(:recipe_type).permit(:name)
  end
end
