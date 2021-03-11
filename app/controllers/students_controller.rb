class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find_by_id(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    student = Student.new
    student.update(require_params(:first_name, :last_name))
    redirect_to student_path(student)
  end

  def edit
    @student = Student.find_by_id(params[:id])
  end

  def update
    student = Student.find_by_id(params[:id])
    student.update(require_params(:first_name, :last_name))
    redirect_to student_path(student)
  end

  private

  def require_params(*args)
    params.require(:student).permit(*args)
  end
end
