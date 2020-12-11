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
          expect(@board.errors.full_messages).to include("Name can't be blank")
        end

        it 'explanationが存在しないと作成できない' do
          @board.explanation = nil
          @board.valid?
          expect(@board.errors.full_messages).to include("Explanation can't be blank")
        end



        it 'nameが存在しないと作成できない' do
          @board.genre_one_id = 1
          @board.valid?
          expect(@board.errors.full_messages).to include("Genre one must be other than 1")
        end


        it '紐づくuserが存在しないと作成できない' do
          @board.user = nil
          @board.valid?
          expect(@board.errors.full_messages).to include("User must exist")
        end

        it '紐づくprofileが存在しないと作成できない' do
          @board.profile = nil
          @board.valid?
          expect(@board.errors.full_messages).to include("Profile must exist")
        end

      end
    end
  end
