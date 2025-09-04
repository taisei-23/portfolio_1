require 'rails_helper'
require 'webmock/rspec'

RSpec.describe 'Google認証', type: :request do
  before do
    OmniAuth.config.test_mode = true
  end

  after do
    OmniAuth.config.mock_auth[:google_oauth2] = nil
  end

  it 'Google認証でユーザーを作成・ログインできる' do
    mock_google_auth(email: 'test_user@example.com')

    get user_google_oauth2_omniauth_callback_path
    follow_redirect!

    expect(User.last.email).to eq('test_user@example.com')
    expect(response.body).to include('ログインしました')
  end

  it '認証が失敗した場合、ログインできない' do
    OmniAuth.config.mock_auth[:google_oauth2] = :invalid_credentials

    get user_google_oauth2_omniauth_callback_path
    follow_redirect!

    expect(User.where(email: 'test_user@example.com')).to be_empty
    expect(flash[:alert]).to eq("ログインできませんでした")
  end
end
