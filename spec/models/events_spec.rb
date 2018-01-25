require 'rails_helper'

RSpec.describe Event, type: :model do
  # Association test
  it { should have_many(:interests)}
  it { should have_many(:users)}
  it { should have_and_belong_to_many(:pairings)}
end
