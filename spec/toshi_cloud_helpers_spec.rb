# frozen_string_literal: true

RSpec.describe ToshiCloudHelpers do
  it "has a version number" do
    expect(ToshiCloudHelpers::VERSION).not_to be nil
  end

  it "does something useful" do
    ToshiCloudHelpers::ToshiWeb::Postgres
    ToshiCloudHelpers::ToshiWeb::DatabaseRow

    ToshiCloudHelpers::ToshiPlan::Mongo
  end
end
