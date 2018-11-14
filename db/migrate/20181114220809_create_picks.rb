class CreatePicks < ActiveRecord::Migration[5.2]
  def change
    create_table :picks do |t|
      t.float :init_price
      t.references :stock, foreign_key: true
      t.references :etf, foreign_key: true

      t.timestamps
    end
  end
end
