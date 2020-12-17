class DmsController < ApplicationController
  before_action :authenticate_user!

  def new
    @dm = Dm.new
  end

  def create

    ActiveRecord::Base.transaction do
      dm = Dm.create!
      dm.user_dms.create!(user_id: current_user.id)
      dm.user_dms.create!(user_id: params[:user_id])

      profile_user_id = params[:user_id]                         #選んだユーザーのユーザーidを取得
      profile_user_dm = UserDm.where(user_id: profile_user_id)  #選んだユーザーのuser_dmsレコード情報を取得
      profile_dm_ids = profile_user_dm.pluck(:dm_id)           #選んだユーザーが持ってるdm_idを配列で取得
      user_dm= UserDm.where(user_id: current_user.id)           #現ユーザーのuser_dmsレコード情報を取得
      dm_ids = user_dm.pluck(:dm_id)                           #現ユーザーが持ってるdm_idを配列で取得
      @intersection = dm_ids & profile_dm_ids                #現ユーザーと選んだユーザーが所属しているdm_id
      redirect_to dm_messages_path(@intersection)
    end

  end

  private

    # def dm_params
    #   params.require(:dm).permit(user_ids: [])
    # end
    
end
