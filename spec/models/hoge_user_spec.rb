require 'rails_helper'

RSpec.describe HogeUser, type: :model do
  before(:each) do
    c = Company.create(name: "test company")
    User.create(name: "test", companies_id: c.id, description: "hoge")
    ApplicationRecord.connection.execute("REFRESH MATERIALIZED VIEW hoge_users")
  end

  after(:each) do
    User.all.map{|u| u.destroy }
    Company.all.map{|u| u.destroy }
  end

  it do
    u = HogeUser.first
    expect(u.user_name).to eq("test")
  end

  it do
    u = HogeUser.first
    expect(u.description).to eq("hoge")
  end

  it do
    u = HogeUser.first
    expect(u.company_name).to eq("test company")
  end
end
