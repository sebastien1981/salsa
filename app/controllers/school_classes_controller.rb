class SchoolClassesController < ApplicationController
  before_action :set_school, only: %i[new create]

  def new
    @schoolclass = SchoolClass.new
  end

  def create
    
    @schoolclass = SchoolClass.new(schoolclass_params)
    @schoolclass.school = @school 
    @schoolclassesroom = SchoolClass.where(beginning_of_time: @schoolclass.beginning_of_time, end_of_time: @schoolclass.end_of_time, room_number: @schoolclass.room_number)
    @schoolclassestea = SchoolClass.where(beginning_of_time: @schoolclass.beginning_of_time, end_of_time: @schoolclass.end_of_time, teacher_name: @schoolclass.teacher_name)
    
    if @schoolclassesroom.any?
      redirect_to new_school_school_class_path(:school_id => @school.id) ,notice: "Cette salle est déja réservé à cette horaire"
    elsif @schoolclassestea.any?
      redirect_to new_school_school_class_path(:school_id => @school.id) ,notice: "Ce professeur est déja pris à cette horaire"
    else 
      if @schoolclass.save
        redirect_to schools_path , notice: "Votre cours a bien été crée"
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  private

  def schoolclass_params
    params.require(:school_class).permit(:type_of_dance, :level, :end_of_time, :beginning_of_time, :day_of_week, :room_number, :teacher_name)
  end

  def set_school
    @school = School.find(params[:school_id])
  end

end