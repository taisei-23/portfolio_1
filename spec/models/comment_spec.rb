require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create(:user) }
  let(:post_record) { create(:post, user: user) }
  let(:comment) { build(:comment, user: user, post: post_record) }

  describe 'バリデーション' do
    it 'body がなければ無効' do
      comment.body = nil
      expect(comment).not_to be_valid
    end

    it 'body があれば有効' do
      expect(comment).to be_valid
    end
  end

  describe '関連付け' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end
end
