class TeachersController < ApplicationController
  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to schools_path, notice: "Vous avez bien crée le professeur"
    else
      render :new, status: :unprocessable_entity
    end 
  end

  private 
  
  def teacher_params
    params.require(:teacher).permit(:name)
  end
end
