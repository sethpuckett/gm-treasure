# frozen_string_literal: true

class CreateArtObjects < ActiveRecord::Migration[5.2]
  def change
    create_table :art_objects do |t|
      t.string :name
      t.integer :cost_in_gp

      t.timestamps
    end
  end
end
