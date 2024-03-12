class SectionsController < ApplicationController
  def index
    @sections = Section.all
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:success] = 'Section create successfully'
      redirect_to sections_path
    else
      flash[:error] = 'Error section didn t save'
      render :new, locals: { section: @section }
    end
  end

  def section_params
    params.require(:section).permit(:name)
  end
end
