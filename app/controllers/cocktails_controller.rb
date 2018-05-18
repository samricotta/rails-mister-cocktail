class CocktailsController < ApplicationController

def index
  @cocktails = Cocktail.all
end

def show
  # raise
  @cocktail = Cocktail.find(params[:id])
end

def new
  @cocktail = Cocktail.new
end

def create
  # raise
@cocktail = Cocktail.new(name: params[:cocktail][:name])
if @cocktail.save
  redirect_to cocktail_path(@cocktail.id)
else
 render :new
end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    @cocktail.save
    redirect_to cocktail_path
  end

end

private

# def cocktail_params
#   params.require(:cocktail).permit(:name)
# end
end

