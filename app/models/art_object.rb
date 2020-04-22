# frozen_string_literal: true

# == Schema Information
#
# Table name: art_objects
#
#  id         :bigint           not null, primary key
#  cost_in_gp :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ArtObject < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :cost_in_gp, presence: true, numericality: { greater_than: 0 }
end
