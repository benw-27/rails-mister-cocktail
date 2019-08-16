class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :destroy]

  def index
    @doses = Dose.all
  end

  def show
  end

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(strong_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose.destroy
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def strong_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end
