require 'rails_helper'

  RSpec.describe Schedule, type: :model do
    before do
      @schedule = FactoryBot.build(:schedule)
    end

    describe 'スケジュール機能' do
      context 'スケジュールの登録できる時' do
        it 'titleが入力され、紐付けされたuserとprofileが存在すれば登録できる' do
          expect(@schedule).to be_valid
        end

        it 'planが入力されなくても登録できる' do
          @schedule.plan = nil
          expect(@schedule).to be_valid
        end
      end

      context 'スケジュールの登録できない時' do
        it 'titleが入力されていないと登録できない' do
          @schedule.title = nil
          @schedule.valid?
          expect(@schedule.errors.full_messages).to include("Titleを入力してください")
        end

        it '紐づくユーザーが存在しないと登録できない' do
          @schedule.user = nil
          @schedule.valid?
          expect(@schedule.errors.full_messages).to include("Userを入力してください")
        end

        it '紐づくprofileが存在しないと登録できない' do
          @schedule.profile = nil
          @schedule.valid?
          expect(@schedule.errors.full_messages).to include("Profileを入力してください")
        end

      end
    end

  end
