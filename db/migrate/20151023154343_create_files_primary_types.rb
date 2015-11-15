class CreateFilesPrimaryTypes < ActiveRecord::Migration
  def change
    create_table :files_primary_types do |t|
      t.string  :name_en
      t.string  :name_ar
      t.boolean :yearly
      t.string :prefix

      t.timestamps null: false
    end
  end
end
