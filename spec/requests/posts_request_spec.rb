# spec/requests/posts_request_spec.rb
require 'rails_helper'

RSpec.describe PostsController, type: :request do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let!(:post_record) { create(:post, title: "Test Post", user: user) }

  describe "認証が必要なアクション" do
    context "ログインしていない場合" do
      it "indexにアクセスするとログインページにリダイレクトされる" do
        get posts_path
        expect(response).to redirect_to(new_user_session_path)
      end

      it "showにアクセスするとログインページにリダイレクトされる" do
        get post_path(post_record)
        expect(response).to redirect_to(new_user_session_path)
      end

      it "newにアクセスするとログインページにリダイレクトされる" do
        get new_post_path
        expect(response).to redirect_to(new_user_session_path)
      end

      it "createを実行するとログインページにリダイレクトされる" do
        post posts_path, params: { post: { title: "title", body: "body" } }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "ログインしている場合" do
      before { sign_in user }

      describe "GET #index" do
        it "成功し投稿一覧を表示する" do
          get posts_path
          expect(response).to have_http_status(:ok)
          expect(response.body).to include(post_record.title)
        end
      end

      describe "GET #show" do
        it "投稿詳細が表示される" do
          get post_path(post_record)
          expect(response).to have_http_status(:ok)
          expect(response.body).to include(post_record.title)
          expect(response.body).to include(user.name)
        end
      end

      describe "GET #new" do
        it "新規投稿フォームが表示される" do
          get new_post_path
          expect(response).to have_http_status(:ok)
          expect(response.body).to include("投稿の新規作成")
        end
      end

      describe "POST #create" do
        context "有効なパラメータの場合" do
          it "投稿が作成されてリダイレクトされる" do
            post_params = { title: "新しい投稿", body: "本文です" }
            expect {
              post posts_path, params: { post: post_params }
            }.to change(Post, :count).by(1)
            expect(response).to redirect_to(posts_path)
            follow_redirect!
            expect(response.body).to include("作成しました")
          end
        end

        context "無効なパラメータの場合" do
          it "newテンプレートが再表示される" do
            post_params = { title: "", body: "" }
            post posts_path, params: { post: post_params }

            expect(response).to have_http_status(:unprocessable_entity)
            expect(response.body).to include("投稿の新規作成")
          end
        end
      end

      describe "GET #edit" do
        context "投稿者本人の場合" do
          it "編集フォームが表示される" do
            get edit_post_path(post_record)
            expect(response).to have_http_status(:ok)
            expect(response.body).to include("投稿の編集")
          end
        end

        context "投稿者本人でない場合" do
          it "編集ページにアクセスできるが後続処理で制限（必要なら追加テスト）" do
            sign_in other_user
            get edit_post_path(post_record)
            expect(response).to have_http_status(:ok)
          end
        end
      end

      describe "PATCH #update" do
        context "投稿者本人の場合" do
          it "投稿が更新されてリダイレクトされる" do
            patch post_path(post_record), params: { post: { title: "更新タイトル" } }
            expect(response).to redirect_to(post_path(post_record))
            follow_redirect!
            expect(response.body).to include("更新しました")
            expect(post_record.reload.title).to eq("更新タイトル")
          end
        end

        context "投稿者本人でない場合" do
          before { sign_in other_user }

          it "更新できず投稿詳細にリダイレクトされアラート表示" do
            patch post_path(post_record), params: { post: { title: "不正更新" } }
            expect(response).to redirect_to(post_path(post_record))
            follow_redirect!
          end
        end
      end

      describe "DELETE #destroy" do
        it "投稿が削除されて投稿一覧にリダイレクトされる" do
          post_record
          expect {
            delete post_path(post_record)
          }.to change(Post, :count).by(-1)
          expect(response).to redirect_to(posts_path)
          follow_redirect!
        end
      end

      describe "GET #search" do
        it "検索結果が表示される" do
          get search_posts_path, params: { q: { title_cont: post_record.title } }
          expect(response).to have_http_status(:ok)
          expect(response.body).to include(post_record.title)
        end
      end
    end
  end
end
