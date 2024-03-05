class HomesController < ApplicationController
  before_action :authenticate_user!
  def index
    case current_user.role
    when 'administrator'
      @name = "Administrator #{current_user.administrators.first.name} #{current_user.administrators.first.first_name}"
    when 'accountant'
      @name = "Accountant #{current_user.accountant.first.name} #{current_user.accountant.first.first_name}"
    when 'teacher'
      @name = "Teacher #{current_user.teachers.first.name} #{current_user.teachers.first.first_name}"
    when 'student'
      @name = "Student #{current_user.students.first.name} #{current_user.students.first.first_name}"
    else
      @name = current_user.email
    end

    @sections = Section.all
  end
end
