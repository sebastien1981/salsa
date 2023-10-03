class SchoolsController < ApplicationController
  def index
    @schools = School.all
  end

  def dashboard
  end

  def new
    @school = School.new
  end

  def create
    
    @school = School.new(school_params)
    
    if @school.save
      @userschool = UserSchool.new(school_id:@school.id, user_id: current_user.id)
      @userschool.save
      redirect_to schools_path , notice: "Votre école a bien été crée"
          
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

def school_params
  params.require(:school).permit(:name, :address, :approval_number, :phone_number, :address_mail_pdt, :phone_number_pdt,:type_of_structure)
end
end
