require 'rails_helper'

RSpec.describe Metagame, type: :model do

  it { should have_many(:games) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:appid) }
end
