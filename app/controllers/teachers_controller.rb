class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  def create
  
    @teacher = Teacher.new(teacher_params)
    @teacher.specialty = @teacher.specialty.delete('\\"').delete('[]')[1..-1]

    if @teacher.specialty == nil
      redirect_to new_teacher_path, notice: "Veuillez chosir une specialité"
    elsif @teacher.specialty != nil
      
      #recuperation dance_id pour l'insert dans la table TeacherDance
      spec_array = []
      dance_array = []
      @teacher.specialty = @teacher.specialty.split(',').each do|spea|
        spec_array << spea.lstrip
        @dance = Dance.find_by(fullname:spea.lstrip)
        dance_array << @dance.id
      end
      
      @teacher.specialty = spec_array 
      @dance = dance_array
      
      @teacher.save
      @dance.each do|dan|
        
        @teacherdance = TeacherDance.new(teacher_id:@teacher.id, dance_id: dan)
        @teacherdance.save
      end
      redirect_to schools_path, notice: "Vous avez bien crée le professeur"
    else
      render :new, status: :unprocessable_entity
    end 
  end

  def show
    if @teacher.specialty == nil
      redirect_to edit_teacher_path(@teacher), notice: "Veuillez chosir une specialité"
    else 
      @teacher
         
      dance_arr = []
       
      @teacherdance = TeacherDance.where(teacher_id: @teacher.id)    
      countel = @teacherdance.count
      
      for n in 0...countel
        dance_arr << Dance.where(id:@teacherdance[n].dance_id)
      end
      
      counttotal = dance_arr.count
      
      arr = []
      
      for n in 0...counttotal
        dance_arr[n].each do |t| 
          arr << t.fullname 
        end
      end

      @teacher.specialty = arr
    end
  end

  def edit
  end

  def update
    
    @teacher.specialty = @teacher.specialty.delete('\\"').delete('[]')[1..-1]
    
    if @teacher.specialty == "[]"
      redirect_to edit_teacher_path(@teacher), notice: "Veuillez chosir une specialité"

    elsif @teacher.specialty != "[]"

      #recuperation dance_id pour l'insert dans la table TeacherDance
      # spec_array = []
      # dance_array = []
      # @teacher.specialty = @teacher.specialty.split(',').each do|spea|
      #   spec_array << spea.lstrip
      #   @dance = Dance.find_by(fullname:spea.lstrip)
      #   dance_array << @dance.id
      # end
      
      # @teacher.specialty = spec_array 
      # @dance = dance_array
      
      # #@teacher.save
      # @dance.each do|dan|
        
      #   @teacherdance = TeacherDance.update(teacher_id:@teacher.id, dance_id: dan).where(teacher_id:@teacher.id)
      #   #@teacherdance.save
      # end
      # raise

      @teacher.update(teacher_params)

      redirect_to teacher_path(@teacher), notice: "Vous avez mis à jour votre professeur"
    end
  end

  def destroy
    @teacher.destroy
    redirect_to teachers_path, status: :see_other, notice: "Vous avez supprimé ce professeur"
  end

  private 
  
  def teacher_params
    params.require(:teacher).permit(:first_name,:last_name,:date_of_birth,:phone_number,:address_mail,specialty:[])
  end

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end
end
