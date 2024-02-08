class ClassroomsController < ApplicationController
  def index
    @classrooms = Classroom.all
  end

  def new
    @classroom = Classroom.new
    @sections = Section.all
  end

  def create
    @sections = Section.all
    @classroom = Classroom.new(classroom_params)
    respond_to do |format|
      format.html do
        if @classroom.save
          flash[:success] = 'classroom saved successfully'
          redirect_to classrooms_path
        else
          flash.now[:error] = "Error : classroom didn't save"
          render :new, locals: { classroom: @classroom }
        end
      end
    end
  end

  def classroom_params
    params.require(:classroom).permit(:section_id, :name, :classement)
  end
end
