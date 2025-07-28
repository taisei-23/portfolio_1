require 'rails_helper'

RSpec.describe "Profiles", type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe "GET /profile/edit" do
    it "正常にレスポンスを返す" do
      get edit_profile_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /profile" do
    context "有効なパラメータの場合" do
      it "プロフィールを更新してリダイレクトする" do
        patch profile_path, params: { user: { name: "新しい名前" } }
        expect(response).to redirect_to(edit_profile_path)
        follow_redirect!
        expect(response.body).to include("プロフィールを更新しました")
        expect(user.reload.name).to eq("新しい名前")
      end
    end

    context "無効なパラメータの場合" do
      it "editテンプレートを再描画する" do
        patch profile_path, params: { user: { name: "" } }
        expect(response).to have_http_status(:success)
        expect(response.body).to include("プロフィールの更新に失敗しました")
      end
    end
  end
end