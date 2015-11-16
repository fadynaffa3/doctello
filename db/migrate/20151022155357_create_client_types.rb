class CreateClientTypes < ActiveRecord::Migration
  def change
    create_table :client_types do |t|

      t.string :name_en
      t.string :name_ar
      t.string :prefix

      t.timestamps null: false
    end
  end
end
