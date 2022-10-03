require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    User.create(name: "test", description: "hoge")
  end

  after(:each) do
    User.all.map{|u| u.destroy }
  end

  it do
    u = User.last
    expect(u.name).to eq("test")
  end

  it do
    u = User.last
    expect(u.description).to eq("hoge")
  end
end
