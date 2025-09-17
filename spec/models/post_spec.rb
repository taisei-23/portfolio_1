require 'rails_helper'

RSpec.describe Post, type: :model do
  it '有効なfactoryを持つ' do
    expect(build(:post)).to be_valid
  end

  it 'titleとcontentが必要' do
    expect(build(:post, title: nil)).not_to be_valid
    expect(build(:post, body: nil)).not_to be_valid
  end
end
