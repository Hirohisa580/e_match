require 'rails_helper'

RSpec.describe "Boards", type: :system do
  before do
    @user = FactoryBot.build(:user)
    @profile = FactoryBot.build(:profile)
    @another_user = FactoryBot.build(:user)
    @another_profile = FactoryBot.build(:profile)
  end

  context 'DMルームが作成できるとき' do
    it 'DMルーム作成ボタンをクリックすれば作成できる' do
      visit root_path
      @user.save
      expect(page).to have_content("ログイン")
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path


      expect(page).to have_content("プロフィール作成")
      visit new_profile_path
      fill_in 'ニックネーム（必須）', with: @profile.nickname
      fill_in '年齢（任意）', with: @profile.age
      select '1989', from: 'profile[birthday(1i)]'
      select '10', from: 'profile[birthday(2i)]'
      select '27', from: 'profile[birthday(3i)]'
      select '三重', from: 'profile[area_id]'
      fill_in '芸歴（任意）', with: @profile.history
      fill_in '自己紹介（必須）', with: @profile.public_relation
      select 'Youtuber', from: 'profile[genre_one_id]'
      select '俳優', from: 'profile[genre_two_id]'
      select '脚本家', from: 'profile[genre_three_id]'  
      image_path = Rails.root.join("app/assets/images/kapibara1.png")
      attach_file('profile[image]', image_path, make_visible: true)
      expect {
        find('input[name="commit"]').click
      }.to change { Profile.count}.by(1)
      expect(current_path).to eq root_path
      expect(page).to have_no_content("プロフィール作成")

      visit root_path
      click_on("ログアウト")

      @another_user.save
      expect(page).to have_content("ログイン")
      visit new_user_session_path
      fill_in 'メールアドレス', with: @another_user.email
      fill_in 'パスワード', with: @another_user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path


      expect(page).to have_content("プロフィール作成")
      visit new_profile_path
      fill_in 'ニックネーム（必須）', with: @another_profile.nickname
      fill_in '年齢（任意）', with: @another_profile.age
      select '1989', from: 'profile[birthday(1i)]'
      select '10', from: 'profile[birthday(2i)]'
      select '27', from: 'profile[birthday(3i)]'
      select '三重', from: 'profile[area_id]'
      fill_in '芸歴（任意）', with: @another_profile.history
      fill_in '自己紹介（必須）', with: @another_profile.public_relation
      select 'Youtuber', from: 'profile[genre_one_id]'
      select '俳優', from: 'profile[genre_two_id]'
      select '脚本家', from: 'profile[genre_three_id]'  
      image_path = Rails.root.join("app/assets/images/kapibara1.png")
      attach_file('profile[image]', image_path, make_visible: true)
      expect {
        find('input[name="commit"]').click
      }.to change { Profile.count}.by(1)
      expect(current_path).to eq root_path
      expect(page).to have_no_content("プロフィール作成")

      
      @dm = Dm.new
      @dm.save
      click_on("#{@profile.nickname}")
      expect {
        find('input[name="commit"]').click
      }.to change { Dm.count }.by(1)
      expect(current_path).to eq "/dms/#{@dm.id + 1}/messages"
    end
  end
end