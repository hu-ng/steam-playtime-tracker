require 'rails_helper'

RSpec.describe Game, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:metagame) }

  it { should validate_presence_of(:playtime) }
end
