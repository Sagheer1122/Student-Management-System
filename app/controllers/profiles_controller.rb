class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    if @user.admin?
      @total_users = User.count
      @total_students = Student.count
      @active_students = Student.where(status: "Active").count
      @inactive_students = Student.where(status: "Inactive").count
      @graduated_students = Student.where(status: "Graduated").count
    else
      @student = @user.student
    end
  end

  def edit
    @user = current_user
    @user.build_student unless @user.student || @user.admin?
  end

  def update
    @user = current_user
    if @user.update(profile_params)
      redirect_to profile_path, notice: "Profile updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:user).permit(:username, :email, student_attributes: [ :name, :roll_number, :class_name, :email, :enrollment_date, :status ])
  end
end
