class SchoolClassesController < ApplicationController
  before_action :set_school, only: %i[new create]

  def new
    @schoolclass = SchoolClass.new
  end

  def create
    
    @schoolclass = SchoolClass.new(schoolclass_params)
    @schoolclass.school = @school

    if @schoolclass.save
       redirect_to schools_path , notice: "Votre cours a bien été crée"
     else
       render :new, status: :unprocessable_entity
     end
    
  end

  private

  def schoolclass_params
    params.require(:school_class).permit(:type_of_dance)
      #, :level, :end_of_time, :beginning_of_time, :day_of_week, :room_number, :teacher_name)
  end

  def set_school
    @school = School.find(params[:school_id])
  end

end
