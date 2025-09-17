require 'rails_helper'

RSpec.describe MountainSearch, type: :model do
  describe '関連付け' do
    it { should belong_to(:user) }
    it { should belong_to(:mountain) }
  end
end
