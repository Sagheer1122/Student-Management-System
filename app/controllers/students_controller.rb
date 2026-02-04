class StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student, only: %i[show edit update destroy]

  def index
    if !current_user.admin?
        redirect_to profile_path
        return
    end
    @q = Student.all.ransack(params[:q])
    @students = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(8)
  end

  def show
  end
  def new
    @student = Student.new
  end

  def edit
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path, notice: "Student created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @student.update(student_params)
      redirect_to @student, notice: "Student updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @student.destroy
    redirect_to students_path, alert: "Student deleted successfully"
  end

  private

  def set_student
      @student = Student.find(params[:id])
  end
    def student_params
      params.require(:student).permit(:student_id, :name, :roll_number, :email, :class_name, :status, :enrollment_date)
    end
end
