class TeachersController < ApplicationController
  
  def index
  end

  def show
  end

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

  def update
  end

  def delete
  end

  private 
  
  def teacher_params
    params.require(:teacher).permit(:first_name,:last_name,:date_of_birth,:phone_number,:address_mail,specialty:[])
  end
end
