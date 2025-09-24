class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    posts_path
  end

  def default_meta_tags
    {
      site: "MountRail",
      title: "スキー場をさがそう",
      description: "MountRailはスキー場を検索できるアプリです。",
      og: {
        site_name: "MountRail",
        title: "スキー場をさがそう",
        description: "MountRailはスキー場を検索できるアプリです。",
        type: "website",
        url: request.original_url,
        image: ActionController::Base.helpers.image_url("ogp.png")
      },
      twitter: {
        card: "summary_large_image"
      }
    }
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name ])
  end
end
