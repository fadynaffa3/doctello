class CreateFilers < ActiveRecord::Migration
  def change
    create_table :filers do |t|
      t.integer :client_id
      t.integer :files_secondary_type_id
      t.string  :name_en
      t.string  :name_ar
      t.string  :notes
      t.date    :transaction_date
      t.string  :file_number

      t.timestamps null: false
    end
    add_foreign_key :filers, :clients
    add_foreign_key :filers, :files_secondary_types
  end
end
