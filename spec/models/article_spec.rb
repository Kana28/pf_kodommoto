# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article,'モデルのテスト', type: :model do
  describe '実際に保存してみる' do
    let(:genre) { Genre.create() }
    let(:article) { FactoryBot.build(:article, genre_id: genre.id) }

    it "有効な投稿内容の場合は保存されるか" do
      expect(article).to be_valid
    end
  end
  context "空白のバリデーションチェック" do
    it "genre_idが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      article = Article.new(genre_id: nil, title: 'hoge', body: 'hoge')
      expect(article).to be_invalid
      expect(article.errors[:genre]).to include("must exist")
    end
    it "titleが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      article = Article.new(genre_id: 'hoge', title: '', body: 'hoge')
      expect(article).to be_invalid
      expect(article.errors[:title]).to include("can't be blank")
    end
    it "bodyが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      article = Article.new(genre_id: 'hoge', title: 'hoge', body: '')
      expect(article).to be_invalid
      expect(article.errors[:body]).to include("can't be blank")
    end
  end
end