class SchoolClassesController < ApplicationController
  before_action :set_school, only: %i[new create]

  def new
    @schoolclass = SchoolClass.new
    @school = School.find(params[:school_id])
    @nameschool = School.where(id: @school.id, school_id: @school.school_id)
    if @school.school_id != nil
      school = @school.school_id
    elsif @school.school_id == nil
      school = @school.id
    end
    @teacherstoselect = Teacher.joins("INNER JOIN school_teachers ON school_teachers.teacher_id = teachers.id INNER JOIN schools ON schools.id = school_teachers.school_id where schools.id = '#{school}' or schools.school_id = '#{school}' ")
    #nombre de room

      x = @school.number_room
      arrtess = []#pour stocker les valeurs que je souhaite
      arrtess << x
      while x > 1
        x -= 1
        arrtess << x
      end
      @countarr = arrtess
  end

  def create

    @schoolclass = SchoolClass.new(schoolclass_params)
    @schoolclass.school = @school
    @schoolclassesroom = SchoolClass.where(beginning_of_time: @schoolclass.beginning_of_time, end_of_time: @schoolclass.end_of_time, room_number: @schoolclass.room_number, day_of_week: @schoolclass.day_of_week, school_name: @schoolclass.school_name)
    @schoolclassestea = SchoolClass.where(beginning_of_time: @schoolclass.beginning_of_time, end_of_time: @schoolclass.end_of_time, teacher_name: @schoolclass.teacher_name, day_of_week: @schoolclass.day_of_week)


    if @schoolclassestea.any?
      redirect_to new_school_school_class_path(:school_id => @school.id) ,notice: "#{@schoolclass.teacher_name} est déja pris à cette horaire"
    elsif @schoolclassesroom.any?
      redirect_to new_school_school_class_path(:school_id => @school.id) ,notice: "La salle est déja réservé à cette horaire dans cette école"
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
    params.require(:school_class).permit(:school_name,:type_of_dance, :level, :end_of_time, :beginning_of_time, :day_of_week, :room_number, :teacher_name)
  end

  def set_school
    @school = School.find(params[:school_id])
  end

end
