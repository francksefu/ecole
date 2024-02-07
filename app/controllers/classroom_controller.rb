class ClassroomsController < ApplicationController

  def index
    @classrooms = Classroom.all
  end

  def new
    @classroom = Classroom.new
  end

  def create
    @classroom = Classroom.new(classroom_params)
    respond_to do |format|
      format.html do
        if @classroom.save
          flash[:success] = 'classroom saved successfully'
          redirect_to classrooms_path
        else
          flash.now[:error] = "Error : classroom didn't save"
          render :new, locals: {classroom: @classroom }
        end
      end
    end
  end

  def classroom_params
    params.require(:classroom).permit(:section, name:, :classement)
  end
end