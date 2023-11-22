class SchoolClassesController < ApplicationController
  before_action :set_school, only: %i[index new create destroy dashboard]

  def index
    @schoolclasses = SchoolClass.where(school_id: @school.id).order(:room_number).order(:beginning_of_time).order(:day_of_week)
  end

  def dashboard
    @schoolclasses = SchoolClass.where(school_id: @school.id).order(:room_number).order(:beginning_of_time).order(:day_of_week)
    roomnumber_arr = []
    @schoolclasses.each do |roomschool|
      roomnumber_arr << roomschool.room_number
    end
    @room = roomnumber_arr.uniq
    roomcount = @room.count

    x = 1
    for n in 0..roomcount
      day_arr = []
      instance_variable_set("@day_arr_#{x}", day_arr)
      instance_variable_set("@begin_arr_#{x}", day_arr)
      instance_variable_set("@end_arr_#{x}", day_arr)
      x += 1
    end

    day_arr_1 = []
    begin_arr_1 = []
    end_arr_1 = []
    # day_arr_2 = []
    # day_arr_3 = []
    # begin_arr_2 = []
    # begin_arr_3 = []
    # end_arr_2 = []
    # end_arr_3 = []


    @schoolclasses.each do |schoolclass|
      if schoolclass.room_number == @room[0]
        day_arr_1 << schoolclass.day_of_week
        begin_arr_1 << schoolclass.beginning_of_time.strftime("%H:%M")
        end_arr_1 << schoolclass.end_of_time.strftime("%H:%M")
      # elsif schoolclass.room_number == 2
      #   day_arr_2 << schoolclass.day_of_week
      #   begin_arr_2 << schoolclass.beginning_of_time.strftime("%H:%M")
      #   end_arr_2 << schoolclass.end_of_time.strftime("%H:%M")
      # else
      #   day_arr_3 << schoolclass.day_of_week
      #   begin_arr_3 << schoolclass.beginning_of_time.strftime("%H:%M")
      #   end_arr_3 << schoolclass.end_of_time.strftime("%H:%M")
      end
    end

    @endtime_1 = end_arr_1[-1]
    @schoolday_1 = day_arr_1.uniq
    @begintime_1 = begin_arr_1.uniq

    # @endtime_2 = end_arr_2[-1]
    # @schoolday_2 = day_arr_2.uniq
    # @begintime_2 = begin_arr_2.uniq

    # @endtime_3 = end_arr_3[-1]
    # @schoolday_3 = day_arr_3.uniq
    # @begintime_3 = begin_arr_3.uniq

    arr_cours_h1 = []
    arr_cours_h2 = []
    arr_cours_h3 = []
    arr_cours_h4 = []

      @schoolclasses.each do |schoolclass|
        if ( schoolclass.beginning_of_time.strftime("%H:%M").include?(@begintime_1[0]) && schoolclass.room_number == @room[0])
              arr_cours_h1 << schoolclass
        elsif(schoolclass.beginning_of_time.strftime("%H:%M").include?(@begintime_1[1]) && schoolclass.room_number == @room[0])
              arr_cours_h2 << schoolclass
        elsif(schoolclass.beginning_of_time.strftime("%H:%M").include?(@begintime_1[2]) && schoolclass.room_number == @room[0])
          arr_cours_h3 << schoolclass
        elsif(schoolclass.beginning_of_time.strftime("%H:%M").include?(@begintime_1[3]) && schoolclass.room_number == @room[0])
          arr_cours_h4 << schoolclass
        end
      end

      @countday = @schoolday_1.count - 1
      t = [arr_cours_h1, arr_cours_h2, arr_cours_h3, arr_cours_h4]
      a = t.count - 1

      for j in 0..a
      k = t
        for i in 0..@countday do
          if(k[j][i] == nil)
            k[j].insert(i, "")
          elsif(k[j][i].day_of_week != @schoolday_1[i])
            k[j].insert(i, "")
          end
        end
      end

        scount = t.count - 1
        x = 1

        for i in 0..scount
          instance_variable_set("@cours_h#{x}", t[i].insert(0, @begintime_1[i]))
          x += 1
        end

      @v = @cours_h1.count - 1
  end

  def new
    @schoolclass = SchoolClass.new
    @school = School.find(params[:school_id])
    set_arg_creation
  end

  def create
    set_arg_creation

    @schoolclass = SchoolClass.new(schoolclass_params)
    @schoolclass.school = @school
    @schoolclassesroom = SchoolClass.where(beginning_of_time: @schoolclass.beginning_of_time, end_of_time: @schoolclass.end_of_time, room_number: @schoolclass.room_number, day_of_week: @schoolclass.day_of_week, school_id: @schoolclass.school_id)
    @schoolclassestea = SchoolClass.where(beginning_of_time: @schoolclass.beginning_of_time, end_of_time: @schoolclass.end_of_time, teacher_name: @schoolclass.teacher_name, day_of_week: @schoolclass.day_of_week)

    if @schoolclassestea.any?
      redirect_to new_school_school_class_path(:school_id => @school.id) ,notice: "#{@schoolclass.teacher_name} est déja pris à cette horaire"
    elsif @schoolclassesroom.any?
      redirect_to new_school_school_class_path(:school_id => @school.id) ,notice: "La salle est déja réservé à cette horaire dans cette école"
    elsif @schoolclass.save
      redirect_to schools_path, notice: "Votre cours a bien été crée"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @schoolclass = SchoolClass.find(params[:id])
    @schoolclass.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to school_school_classes_path(:school_id => @school.id), status: :see_other
  end

  private

  def schoolclass_params
    params.require(:school_class).permit(:type_of_dance, :level, :end_of_time, :beginning_of_time, :day_of_week, :teacher_name, :room_number)
  end

  def set_school
    @school = School.find(params[:school_id])
  end

  def set_arg_creation
    @nameschool = School.where(id: @school.id, school_id: @school.school_id)
    if @school.school_id != nil
      school = @school.school_id
    elsif @school.school_id == nil
      school = @school.id
    end
    @teacherstoselect = Teacher.joins("INNER JOIN school_teachers ON school_teachers.teacher_id = teachers.id INNER JOIN schools ON schools.id = school_teachers.school_id where schools.id = #{school} or schools.school_id = #{school} ")
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
end
