class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  def index
    @school = School.find(params[:school_id])
    @teachers = Teacher.all
  end

  def new
    @school = School.find(params[:school_id])
    @teacher = Teacher.new
    @dances = Dance.all
  end

  def create
    @school = School.find(params[:school_id])
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      @schoolteacher = SchoolTeacher.new(school_id:@school.id, teacher_id: @teacher.id)
      @schoolteacher.save
      redirect_to school_teachers_path, notice: "Vous avez bien crée le professeur: #{@teacher.first_name} #{@teacher.last_name}"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @school = School.find(params[:school_id])
    school_id = @school.id
  end

  def edit
    @school = School.find(params[:school_id])
  end

  def update
    @school = School.find(params[:school_id])
    @teacher.update(teacher_params)
    redirect_to school_teacher_path(@school,@teacher), notice: "Vous avez bien mis à jour le professeur: #{@teacher.first_name} #{@teacher.last_name}"
  end

  private

  def teacher_params
    params.require(:teacher).permit(:first_name, :last_name, :date_of_birth, :phone_number, :address_mail, dance_ids:[])
  end

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end
end
