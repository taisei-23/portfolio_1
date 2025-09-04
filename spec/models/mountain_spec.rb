require 'rails_helper'

RSpec.describe Mountain, type: :model do
  let(:mountain) { create(:mountain) }
  let(:user) { create(:user) }

  describe '関連付け' do
    it { should have_many(:mountain_searches).dependent(:destroy) }
    it { should have_many(:users).through(:mountain_searches) }
  end
end
