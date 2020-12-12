require 'rails_helper'

  RSpec.describe Board, type: :model do
    before do
      @board = FactoryBot.build(:board)
    end

    describe '掲示板作成機能' do
      context '掲示板を作成できる時' do
        it 'nameとexplanationが入力され、genre_one_idが１以外が選ばれていて、紐づくuserとprofileが存在すれば作成できる' do
          expect(@board).to be_valid
        end
      end

      context '掲示板を作成できない時' do
        it 'nameが存在しないと作成できない' do
          @board.name = nil
          @board.valid?
          expect(@board.errors.full_messages).to include("Nameを入力してください")
        end

        it 'explanationが存在しないと作成できない' do
          @board.explanation = nil
          @board.valid?
          expect(@board.errors.full_messages).to include("Explanationを入力してください")
        end



        it 'nameが存在しないと作成できない' do
          @board.genre_one_id = 1
          @board.valid?
          expect(@board.errors.full_messages).to include("Genre oneは1以外の値にしてください")
        end


        it '紐づくuserが存在しないと作成できない' do
          @board.user = nil
          @board.valid?
          expect(@board.errors.full_messages).to include("Userを入力してください")
        end

        it '紐づくprofileが存在しないと作成できない' do
          @board.profile = nil
          @board.valid?
          expect(@board.errors.full_messages).to include("Profileを入力してください")
        end

      end
    end
  end
