require 'rails_helper'

  RSpec.describe Message, type: :model do
    before do
      @message = FactoryBot.build(:message)
    end

    describe 'DMメッセージ機能' do
      context 'メッセージできる時' do
        it 'messageが入力されていて、紐づくuserとprofileとdmがあればコメントできる' do
          expect(@message).to be_valid
        end
      end

      context 'メッセージできない時' do
        it 'messageが空だとメッセージできない' do
          @message.message = nil
          @message.valid?
          expect(@message.errors.full_messages).to include("Messageを入力してください")
        end


        it '紐づくuserが存在しないとメッセージできない' do
          @message.user = nil
          @message.valid?
          expect(@message.errors.full_messages).to include("Userを入力してください")
        end

        it '紐づくprofileが存在しないとメッセージできない' do
          @message.profile = nil
          @message.valid?
          expect(@message.errors.full_messages).to include("Profileを入力してください")
        end
      
        it '紐づくdmが存在しないとメッセージできない' do
          @message.dm = nil
          @message.valid?
          expect(@message.errors.full_messages).to include("Dmを入力してください")
        end
      end
    end

  end

