# frozen_string_literal: true

FactoryBot.define do
  factory :art_object do
    cost_in_gp { 250 }
    name { 'Silk robe with gold embroidery' }
  end
end
