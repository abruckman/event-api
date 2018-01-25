require 'rails_helper'

RSpec.describe User, type: :model do
  # Association test
  it { should have_many(:interests)}
  it { should have_many(:events)}
  it { should have_and_belong_to_many(:pairings)}
  it { should have_many(:users).through(:events)}
  it { should have_many(:pairs).through(:pairings)}
  it { should have_many(:likes)}
end
