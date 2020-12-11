require 'rails_helper'

  RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー登録機能' do
      context 'ユーザー登録出来る時' do
        it 'first_nameとfirst_name_rubyとlast_nameとlast_name_rubyとphone_numberがあれば登録できる' do
          expect(@user).to be_valid
        end
      end

      context 'ユーザー登録出来ない時' do
        it 'first_nameが空の時登録できない' do
          @user.first_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it 'first_name_rubyが空だと登録できない' do
          @user.first_name_ruby = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name ruby can't be blank")
        end

        it 'last_nameが空だと登録できない' do
          @user.last_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end

        it 'last_name_rubyが空だと登録できない' do
          @user.last_name_ruby = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name ruby can't be blank")
        end

        it 'phone_numberが空だと登録できない' do
          @user.phone_number = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Phone number can't be blank")
        end



        it 'first_nameが英語だと登録でき無い' do
          @user.first_name = "Tamako"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid")
        end

        it 'last_nameが英語だと登録でき無い' do
          @user.last_name = "Yamada"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name is invalid")
        end

        it 'first_name_rubyが英語だと登録でき無い' do
          @user.first_name_ruby = "Tamako"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name ruby is invalid")
        end

        it 'first_name_rubyが漢字だと登録でき無い' do
          @user.first_name_ruby = "球子"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name ruby is invalid")
        end

        it 'first_name_rubyがカタカナだと登録でき無い' do
          @user.first_name_ruby = "タマコ"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name ruby is invalid")
        end

        it 'last_name_rubyが英語だと登録でき無い' do
          @user.last_name_ruby = "Yamada"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name ruby is invalid")
        end

        it 'last_name_rubyが漢字だと登録でき無い' do
          @user.last_name_ruby = "山田"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name ruby is invalid")
        end

        it 'last_name_rubyがカタカナだと登録でき無い' do
          @user.last_name_ruby = "ヤマダ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name ruby is invalid")
        end



        it 'phone_numberが半角数字じゃないと登録でき無い' do
          @user.phone_number = "０９０１２３４５６７８"
          @user.valid?
          expect(@user.errors.full_messages).to include("Phone number is invalid")
        end

        it 'phone_numberが半角じゃないと登録でき無い' do
          @user.phone_number = "０９０１２３４５６７８"
          @user.valid?
          expect(@user.errors.full_messages).to include("Phone number is invalid")
        end

        it 'phone_numberが文字だと登録でき無い' do
          @user.phone_number = "零九零一二三四五六七八"
          @user.valid?
          expect(@user.errors.full_messages).to include("Phone number is invalid")
        end


        it 'emailが空だと登録できない' do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it 'emailが重複していると登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end



        it "passwordが空だと登録できない" do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
  
        it "password_confirmationが空だと登録できない" do
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
  
        it "passwordとpassword_confirmationが一致しない場合は登録できない" do
          @user.password_confirmation = "b12345"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
  
        it "passwordが半角数字のみの場合は登録できない" do
          @user.password = "123456"
          @user.password_confirmation = "123456"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
  
        it "passwordが半角英字のみの場合は登録できない" do
          @user.password = "abcdef"
          @user.password_confirmation = "abcdef"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
  
        it "passwordが全角の場合は登録できない" do
          @user.password = "Ａ１２３４"
          @user.password_confirmation = "Ａ１２３４"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
  
        it "passwordが半角英数字混合だが、5文字以下だと登録できない" do
          @user.password = "a1234"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
      end
    end
  end
