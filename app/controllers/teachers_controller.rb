class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  def index
    @teachers = Teacher.all
  end

  def show
    @teacher.specialty = @teacher.specialty.delete('\\"').delete('[]')[1..-1]
    
  end

  def new
    @teacher = Teacher.new
  end

  def create
    
    @teacher = Teacher.new(teacher_params)
    @teacher.specialty = @teacher.specialty.delete('\\"')
    if @teacher.specialty == "[]"
      redirect_to new_teacher_path, notice: "Veuillez chosir une specialité"
    elsif @teacher.save
      redirect_to schools_path, notice: "Vous avez bien crée le professeur"
    else
      render :new, status: :unprocessable_entity
    end 
  end

  def edit
  end

  def update
    @teacher.update(teacher_params)
    
    @teacher.specialty = @teacher.specialty.delete('\\"')
    if @teacher.specialty == "[]"
      redirect_to edit_teacher_path(@teacher), notice: "Veuillez chosir une specialité"
    else
      redirect_to teacher_path(@teacher)
    end
  end

  def destroy
    @teacher.destroy
    redirect_to teachers_path, status: :see_other
  end

  private 
  
  def teacher_params
    params.require(:teacher).permit(:first_name,:last_name,:date_of_birth,:phone_number,:address_mail,specialty:[])
  end

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end
end
