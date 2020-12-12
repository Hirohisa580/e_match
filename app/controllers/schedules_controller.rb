class SchedulesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :header_variable, only: [:index, :new, :show, :edit]
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]
  before_action :set_profile, only: [:new, :show, :edit]
  
  def index
    @profile_id = params[:profile_id]
    @my_schedule = Schedule.where(profile_id: @profile_id)
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.save
    redirect_to "/profiles/#{params[:profile_id]}/schedules"
  end

  def show

  end

  def edit

  end

  def update
    @schedule.update(schedule_params)
    redirect_to profile_schedules_path
  end

  def destroy
    @schedule.destroy
    redirect_to profile_schedules_path
  end


  private

  def header_variable
    @profile_user_id = Profile.pluck(:user_id)
    @user_profile = Profile.find_by(user_id: current_user.id)
    @current_profile = Profile.find_by(user_id: current_user.id)
  end

  def schedule_params
    params.require(:schedule).permit(:title, :plan, :start_time).merge(user_id: current_user.id, profile_id: params[:profile_id])
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def set_profile
    @profile = Profile.find(params[:profile_id])
  end

end