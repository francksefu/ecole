class HomesController < ApplicationController
  before_action :authenticate_user!
  def index
    case current_user.role
    when 'administrator'
      @name = "Administrator #{current_user.administrators.first.name} #{current_user.administrators.first.first_name}"
    when 'accountant'
      @name = "Accountant #{current_user.accountants.first.name} #{current_user.accountants.first.first_name}"
    when 'teacher'
      @name = "Teacher #{current_user.teachers.first.name} #{current_user.teachers.first.first_name}"
    when 'student'
      @name = "Student #{current_user.students.first.name} #{current_user.students.first.first_name}"
    when 'studies_director'
      @name = "Studies director #{current_user.studies_directors.first.name} #{current_user.studies_directors.first.first_name}"

    else
      @name = current_user.email
    end

    @sections = Section.all
  end
end
