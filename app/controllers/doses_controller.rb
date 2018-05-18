class DosesController < ApplicationController

#before_action :method_name
  def new
    @ingredients = Ingredient.all
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Ingredient.find(params[:dose][:ingredient])
    @dose = Dose.new(description: params[:dose][:description])
    @dose.cocktail = @cocktail
    @dose.ingredient = @ingredient
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    cocktail = @dose.cocktail
    @dose.destroy
    @dose.save
    redirect_to cocktail_path(cocktail)
  end

# private

#   def doses_params
#     params.require(:doses).permit(:description)
#   end
end
# {description: ""}
