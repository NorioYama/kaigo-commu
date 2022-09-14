require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '質問投稿' do
    context '投稿できる時' do
      it 'すべてのフォームが入力されれば投稿できる' do
        expect(@post).to be_valid
      end
    end

    context '投稿できない時' do
      it 'タイトルが入力されていないと投稿できない' do
        @post.title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("タイトルが入力されていません。")
      end
      it '本文が入力されてないと投稿できない' do
        @post.body = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("本文が入力されていません。")
      end
      it 'ユーザーが紐づいていないと投稿できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
