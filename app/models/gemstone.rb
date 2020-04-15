# frozen_string_literal: true

# == Schema Information
#
# Table name: gemstones
#
#  id          :bigint           not null, primary key
#  cost_in_gp  :integer
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Gemstone < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :cost_in_gp, presence: true, numericality: { greater_than: 0 }
end
