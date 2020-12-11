class MessagesController < ApplicationController
  before_action :header_variable

  def index
    @message = Message.new
    i = UserDm.where(dm_id: params[:dm_id])             #選んだユーザーと現ユーザーのuser_dmsテーブル情報を取得
    user_id_arry = i.pluck(:user_id)                    #選んだユーザーと現ユーザーのuser_idを配列で取得
    user_id = user_id_arry[0]                           #選んだユーザーのusr_idを取得 

    @all_user = Message.where(user_id: user_id_arry)    #現在いるDMルームにいるユーザー二人を取得
    # @all_user_desc = all_user.order("id DESC")        #降順にしたが、昇順の方がよかった

    o = UserDm.where(user_id: current_user.id)          #現ユーザーのuser_dmsテーブル情報の取得
    l = o.pluck(:dm_id)                                 #現ユーザーが所属するdm_idを配列で取得
    m = UserDm.where(dm_id: l)                          #現ユーザーとDMで繋がっているユーザーのuser_dmsテーブル情報を取得
    n = m.pluck(:user_id)                               #上記のユーザー達と現ユーザーのuser_idを配列で取得（重複あり）
    @n_uniq = n.uniq                                    #上記の配列から重複を除外
    @n_uniq.delete(current_user.id)  #[1,5,3]           #現ユーザーのuser_idを除外
    
    @h = Profile.where(user_id: @n_uniq).order(['field(user_id, ?)', @n_uniq])    #配列の順番を保ったまま、モデルから情報を取得

    s = m.pluck(:dm_id)
    @s_uniq = s.uniq     
                                 
    current_dm = i.pluck(:dm_id)                          #現ユーザーとDMで繋がっているユーザーが所属しているdm_idを配列で取得  
    @current_dm_uniq = current_dm.uniq
    @r = Message.where(dm_id: @current_dm_uniq)
    
    user_id_arry = i.pluck(:user_id)  
    @b = Profile.where(user_id: user_id_arry)              #現在いるDMルームにいるユーザー二人のprofilesテーブル情報を取得
    @b_nickname_arry = @b.pluck(:nickname) 

    user_id_arry.delete(current_user.id)                   #DMルームの二人のuser_idから現ユーザーのuser_idを削除
    @b_other = Profile.find_by(user_id: user_id_arry)
  
  end

  def create
    i = UserDm.where(dm_id: params[:dm_id])               #選んだユーザーと現ユーザーのuser_dmsテーブル情報を取得
    user_id_arry = i.pluck(:user_id)  
    @b = Profile.where(user_id: user_id_arry)              #現在いるDMルームにいるユーザー二人のprofilesテーブル情報を取得
    @b_nickname_arry = @b.pluck(:nickname)                 #現在いるDMルームにいるユーザー二人のニックネームを取得
    @message = Message.new(set_message)
    if @message.save
      redirect_to dm_messages_path(params[:dm_id])
    else
      render :index
    end
  end
    


  private
  def header_variable
    @profile_user_id = Profile.pluck(:user_id)
    @user_profile = Profile.find_by(user_id: current_user.id)
    @current_profile = Profile.find_by(user_id: current_user.id)
  end

  def set_message
    params.require(:message).permit(:message).merge(user_id: current_user.id, dm_id: params[:dm_id])
  end
end