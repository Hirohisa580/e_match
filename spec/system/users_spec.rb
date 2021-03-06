require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規登録ができるとき' do 
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      visit root_path

      expect(page).to have_content('新規登録')
      visit new_user_registration_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      fill_in 'パスワード（確認）', with: @user.password_confirmation
      fill_in '名字（漢字）', with: @user.last_name
      fill_in '名前（漢字）', with: @user.first_name
      fill_in '名字（ふりがな）', with: @user.last_name_ruby
      fill_in '名前（ふりがな）', with: @user.first_name_ruby
      fill_in '電話番号', with: @user.phone_number
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      expect(current_path).to eq root_path
      
      expect(page).to have_content('ログアウト')
      expect(page).to have_content('ログイン中')
      expect(page).to have_no_content('新規登録')
    end
  end

  context 'ユーザーが新規登録できないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      visit root_path
      expect(page).to have_content('新規登録')
      visit new_user_registration_path
      fill_in 'メールアドレス', with: ""
      fill_in 'パスワード', with: ""
      fill_in 'パスワード（確認）', with: ""
      fill_in '名字（漢字）', with: ""
      fill_in '名前（漢字）', with: ""
      fill_in '名字（ふりがな）', with: ""
      fill_in '名前（ふりがな）', with: ""
      fill_in '電話番号', with: ""
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(0)
      expect(current_path).to eq "/users"
    end
  end
end