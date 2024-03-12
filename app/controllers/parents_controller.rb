class ParentsController < ApplicationController
  def index
    @parents = Parent.all
  end

  def new
    @parent = Parent.new
  end

  def create
    @parent = Parent.new(name: params[:parent][:name], first_name: params[:parent][:first_name],
                         phone: params[:parent][:phone], user: User.first)
    respond_to do |format|
      format.html do
        if @parent.save
          @parent.create_associate_user('parent')
          flash[:success] = 'Parent saved successfully'
          redirect_to parents_path
        else
          flash.now[:error] = "Error : Parent didn't save"
          render :new, locals: { parent: @parent }
        end
      end
    end
  end

  def parent_params
    params.require(:parent).permit(:name, :first_name, :phone)
  end
end
