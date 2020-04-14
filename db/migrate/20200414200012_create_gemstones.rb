class CreateGemstones < ActiveRecord::Migration[5.2]
  def change
    create_table :gemstones do |t|
      t.string :name
      t.text :description
      t.integer :cost_in_gp

      t.timestamps
    end
  end
end
