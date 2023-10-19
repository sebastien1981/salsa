class DancesController < ApplicationController
  def new
    @dance = Dance.new
  end

  def create
    @dance = Dance.new(dance_params)
    if @dance.save
      redirect_to schools_path, notice: "Vous avez bien crée un nouveau type de dance:#{@dance.fullname}"
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def dance_params
      params.require(:dance).permit(:fullname)
  end
end
