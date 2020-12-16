require 'rails_helper'

RSpec.describe "Profiles", type: :system do
  before do
    @profile = FactoryBot.build(:profile)
    @user = FactoryBot.build(:user)
  end

  context 'プロフィール作成ができる時' do
    it '正しい情報を入力すれば作成できる' do
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
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
    end
  end

  context 'プロフィール作成ができない時' do
    it '誤った入力をすると作成できない' do
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
      fill_in 'ニックネーム（必須）', with: ""
      fill_in '年齢（任意）', with: ""
      select '--', from: 'profile[birthday(1i)]'
      select '--', from: 'profile[birthday(2i)]'
      select '--', from: 'profile[birthday(3i)]'
      select '--', from: 'profile[area_id]'
      fill_in '芸歴（任意）', with: ""
      fill_in '自己紹介（必須）', with: ""
      select '--', from: 'profile[genre_one_id]'
      select '--', from: 'profile[genre_two_id]'
      select '--', from: 'profile[genre_three_id]'  
      image_path = Rails.root.join("app/assets/images/kapibara1.png")
      attach_file('profile[image]', image_path, make_visible: true)
      find('input[name="commit"]').click
      expect(current_path).to eq "/profiles"

    end
  end
end
