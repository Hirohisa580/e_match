class BoardsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :edit]
  before_action :header_variable, only: [:index, :new, :edit]
  before_action :set_board, only: [:edit, :update, :destroy]

  def index
    @board_all = Board.all
    @profile_all = Profile.all
  end

  def new
    @board = Board.new
    @profile = Profile.find_by(user_id: current_user.id)
  end

  def create
    @board = Board.new(board_params)
    if @board.save
     redirect_to boards_path
    else
      header_variable
      render :new
    end
  end

  def edit

  end

  def update

    @board.update(board_params)
    redirect_to boards_path
  end

  def destroy

    @board.destroy
    redirect_to boards_path
  end

  def checked
    # board = Board.find(params[:id])
    # if board.checked 
    #   board.update(checked: false)
    # else
    #   board.update(checked: true)
    # end

    item = Board.find(params[:id])
    render json: { board: item }
  end



  private

  def header_variable
    @user_profile = Profile.find_by(user_id: current_user.id)
    @profile_user_id = Profile.pluck(:user_id)
    @current_profile = Profile.find_by(user_id: current_user.id)
  end

  def board_params
    @profile = Profile.find_by(user_id: current_user.id)
    params.require(:board).permit(:name, :genre_one_id, :explanation).merge(profile_id: @profile.id, user_id: current_user.id)
  end

  def set_board
    @board = Board.find(params[:id])
  end


end
