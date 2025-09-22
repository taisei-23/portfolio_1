module ApplicationHelper
  def default_meta_tags
    {
      site: 'MountRail',
      title: 'スキー場をさがそう',
      reverse: true,
      charset: 'utf-8',
      description: 'MountRail は全国のスキー場を検索できるアプリです',
      keywords: 'スキー, スノーボード, 雪山, Rails',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: 'MountRail',
        title: 'スキー場をさがそう',
        description: 'MountRail は全国のスキー場を検索できるアプリです',
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png')
      },
      twitter: {
        card: 'summary_large_image',
        site: '@your_twitter_id'
      }
    }
  end
end
