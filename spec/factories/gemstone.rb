# frozen_string_literal: true

FactoryBot.define do
  factory :gemstone do
    cost_in_gp { 500 }
    description { 'description' }
    name { 'Rose Quartz' }
  end
end
