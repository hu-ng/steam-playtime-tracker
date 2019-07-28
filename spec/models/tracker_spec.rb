require 'rails_helper'

RSpec.describe Tracker, type: :model do
  it { should belong_to(:game) }
  it { should validate_presence_of(:threshold) }
end
