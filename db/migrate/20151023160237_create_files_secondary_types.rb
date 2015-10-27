class CreateFilesSecondaryTypes < ActiveRecord::Migration
  def change
    create_table :files_secondary_types do |t|
      t.integer :files_primary_type_id
      t.string  :name_en
      t.string  :name_ar

      t.timestamps null: false
    end

    add_foreign_key :files_secondary_types, :files_primary_types
  end

end
