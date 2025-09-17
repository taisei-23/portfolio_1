require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:post_record) { create(:post) }

  describe 'バリデーション' do
    it 'name がなければ無効' do
      user.name = nil
      expect(user).not_to be_valid
    end

    it '有効な user は保存できる' do
      expect(user).to be_valid
    end
  end

  describe '関連付け' do
    it { should have_many(:posts).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:bookmarks).dependent(:destroy) }
    it { should have_many(:bookmarked_posts).through(:bookmarks).source(:post) }
    it { should have_many(:mountain_searches).dependent(:destroy) }
    it { should have_many(:mountains).through(:mountain_searches) }
    it { should have_one_attached(:icon_image) }
  end

  describe '#bookmark?' do
    it 'ブックマークしていない投稿は false を返す' do
      expect(user.bookmark?(post_record)).to be false
    end

    it 'ブックマークしている投稿は true を返す' do
      user.bookmarks.create(post: post_record)
      expect(user.bookmark?(post_record)).to be true
    end
  end

  describe '.from_omniauth' do
    before do
        OmniAuth.config.test_mode = true
    end

    let(:auth) do
        OmniAuth::AuthHash.new(
        provider: 'google_oauth2',
        uid: '1234567890',
        info: { name: 'Test User', email: 'test@example.com' }
        )
    end

    before do
      tables = %w[bookmarks posts comments mountain_searches users]
      ActiveRecord::Base.connection.execute("TRUNCATE #{tables.join(', ')} RESTART IDENTITY CASCADE")
    end

    it 'OAuth 情報からユーザーを作成できる' do
      expect { User.from_omniauth(auth) }.to change(User, :count).by(1)
    end

    it '既存ユーザーがあれば新規作成しない' do
      existing_user = User.from_omniauth(auth)
      expect { User.from_omniauth(auth) }.not_to change(User, :count)
    end
  end
end
