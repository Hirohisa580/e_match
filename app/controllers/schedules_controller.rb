class SchedulesController < ApplicationController
  before_action :header_variable, only: [:index, :new, :show]
  
  def index
    @profile_id = params[:profile_id]
    @schedule_all = Schedule.all
  end

  def new
    @schedule = Schedule.new
    @profile = Profile.find(params[:profile_id])
  end

  def create
    binding.pry
    @schedule = Schedule.new(params_schedule)
    @schedule.save
    redirect_to "/profiles/#{params[:profile_id]}/schedules"
  end

  def show
    @schedule = Schedule.find(params[:id])
  end


  private

  def header_variable
    @profile_user_id = Profile.pluck(:user_id)
    @user_profile = Profile.find_by(user_id: current_user.id)
    @current_profile = Profile.find_by(user_id: current_user.id)
  end

  def params_schedule
    params.require(:schedule).permit(:title, :plan, :start_time).merge(user_id: current_user.id, profile_id: params[:profile_id])
  end

end
