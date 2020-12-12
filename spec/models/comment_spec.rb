require 'rails_helper'

  RSpec.describe Comment, type: :model do
    before do
      @comment = FactoryBot.build(:comment)
    end

    describe '掲示板コメント機能' do
      context 'コメントできる時' do
        it 'commentが入力されていて、紐づくuserとprofileとboardがあればコメントできる' do
          expect(@comment).to be_valid
        end
      end

      context 'コメントできない時' do
        it 'commentが空だとコメントできない' do
          @comment.comment = nil
          @comment.valid?
          expect(@comment.errors.full_messages).to include("Commentを入力してください")
        end


        it '紐づくuserが存在しないとコメントできない' do
          @comment.user = nil
          @comment.valid?
          expect(@comment.errors.full_messages).to include("Userを入力してください")
        end

        it '紐づくprofileが存在しないとコメントできない' do
          @comment.profile = nil
          @comment.valid?
          expect(@comment.errors.full_messages).to include("Profileを入力してください")
        end
      
        it '紐づくprofileが存在しないとコメントできない' do
          @comment.board = nil
          @comment.valid?
          expect(@comment.errors.full_messages).to include("Boardを入力してください")
        end
      end
    end
  end
