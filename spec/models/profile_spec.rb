require 'rails_helper'

  RSpec.describe User, type: :model do
    before do
      @profile = FactoryBot.build(:profile)
    end

    describe 'プロフィール登録機能' do
      context 'プロフィール登録出来る時' do
        it 'nicknameとpublic_relationとimageが存在し、area_idとgenre_one_idが１以外が選ばれ、紐付くユーザーが存在すれば登録できる' do
          @profile.age = nil
          @profile.history = nil
          @profile.birthday = nil
          @profile.genre_two_id = 1
          @profile.genre_three_id = 1
          expect(@profile).to be_valid
        end
      end

      context 'プロフィール登録出来ない時' do
        it 'nicknameが空では登録できない' do
          @profile.nickname = nil
          @profile.valid?
          expect(@profile.errors.full_messages).to include("Nicknameを入力してください")
        end

        it 'pubilic_relationが空だと登録できない' do
          @profile.public_relation = nil
          @profile.valid?
          expect(@profile.errors.full_messages).to include("Public relationを入力してください")
        end

        it 'imageが空だと登録できない' do
          @profile.image = nil
          @profile.valid?
          expect(@profile.errors.full_messages).to include("Imageを入力してください")
        end



        it 'area_idが１だと登録できない' do
          @profile.area_id = 1
          @profile.valid?
          expect(@profile.errors.full_messages).to include("Areaは1以外の値にしてください")
        end
        it 'genre_one_idが１だと登録できない' do
          @profile.genre_one_id = 1
          @profile.valid?
          expect(@profile.errors.full_messages).to include("Genre oneは1以外の値にしてください")
        end



        it 'ageを記入する際に文字を記入すると登録できない' do
          @profile.age = "25歳"
          @profile.valid?
          expect(@profile.errors.full_messages).to include("Ageは不正な値です")
        end

        it 'ageを記入する際に全角で記入すると登録できない' do
          @profile.age = "２５"
          @profile.valid?
          expect(@profile.errors.full_messages).to include("Ageは不正な値です")
        end

        it 'historyを記入する際に文字を記入すると登録できない' do
          @profile.history = "40年"
          @profile.valid?
          expect(@profile.errors.full_messages).to include("Historyは不正な値です")
        end

        it 'historyを記入する際に全角で記入すると登録できない' do
          @profile.history = "４０"
          @profile.valid?
          expect(@profile.errors.full_messages).to include("Historyは不正な値です")
        end



        it '紐付くユーザーが存在しないと登録できない' do
          @profile.user = nil
          @profile.valid?
          expect(@profile.errors.full_messages).to include("Userを入力してください")
        end
        
      end
    end
  end
