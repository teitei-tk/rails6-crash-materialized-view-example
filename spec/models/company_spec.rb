require 'rails_helper'

RSpec.describe Company, type: :model do
  before(:each) do
    Company.create(name: "test company")
  end

  after(:each) do
    Company.all.map{|u| u.destroy }
  end

  it do
    u = Company.last
    expect(u.name).to eq("test company")
  end
end
