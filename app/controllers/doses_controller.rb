class DosesController < ApplicationController
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to @cocktail
    else
      render 'cocktails/show'
    end
  end

  def delete

  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
