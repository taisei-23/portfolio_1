class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    # まず icon_image が params にあるかチェック
    icon_image_attaching = user_params[:icon_image].present?

    if @user.update(user_params)
      # アイコンが更新された場合のみログ出力
      if icon_image_attaching
        Rails.logger.info "User #{@user.id} がアイコンを更新しました: #{@user.icon_image.filename}"
      end

      redirect_to edit_profile_path, notice: "プロフィールを更新しました"
    else
      # アイコン更新時のエラーもログに
      if icon_image_attaching
        Rails.logger.error "User #{@user.id} アイコン更新失敗: #{@user.errors.full_messages.join(', ')}"
      end

      flash.now[:alert] = "プロフィールの更新に失敗しました"
      render :edit
    end
  rescue => e
    # 例外発生時もアイコン更新の場合だけログ
    if icon_image_attaching
      Rails.logger.error "User #{@user.id} アイコン更新中に例外発生: #{e.message}\n#{e.backtrace.join("\n")}"
    end
    redirect_to edit_profile_path, alert: "予期せぬエラーが発生しました"
  end

  private

  def user_params
    params.require(:user).permit(:name, :icon_image)
  end
end
