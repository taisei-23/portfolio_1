require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  it '有効なfactoryを持つ' do
    expect(build(:bookmark)).to be_valid
  end

  it 'userとpostが必要' do
    expect(build(:bookmark, user: nil)).not_to be_valid
    expect(build(:bookmark, post: nil)).not_to be_valid
  end
end
