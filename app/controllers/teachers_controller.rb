class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
    @dances = Dance.all
  end

  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      redirect_to schools_path, notice: "Vous avez bien crée le professeur: #{@teacher.first_name} #{@teacher.last_name}"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    @teacher.update(teacher_params)
    redirect_to teacher_path(@teacher), notice: "Vous avez bien crée le professeur: #{@teacher.first_name} #{@teacher.last_name}"
  end

  def destroy
    @teacher.destroy
    redirect_to teachers_path, status: :see_other, notice: "Vous avez supprimé ce professeur"
  end

  private

  def teacher_params
    params.require(:teacher).permit(:first_name, :last_name, :date_of_birth, :phone_number, :address_mail, dance_ids:[])
  end

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end
end
