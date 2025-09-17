require 'rails_helper'

RSpec.describe 'Bookmarks', type: :request do
  let(:user) { create(:user) }
  let(:post_record) { create(:post) }
  let(:bookmark) { create(:bookmark, user: user, post: post_record) }

  before { sign_in user }

  describe 'POST /posts/:post_id/bookmarks' do
    it '投稿をブックマークできる' do
      post post_bookmarks_path(post_record)

      expect(response).to redirect_to(post_path(post_record))
      follow_redirect!
      expect(response.body).to include("ブックマークしました")
      expect(user.bookmarks.exists?(post: post_record)).to be true
    end
  end

  describe 'DELETE /posts/:post_id/bookmarks/:id' do
    it 'ブックマークを削除できる' do
      delete post_bookmark_path(post_record, bookmark), headers: { "Accept" => "text/vnd.turbo-stream.html" }

      expect(response).to have_http_status(:success)
      expect(user.bookmarks.exists?(post: post_record)).to be false
    end
  end
end
