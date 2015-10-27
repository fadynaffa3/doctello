class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.integer :client_type_id
      t.string  :name_en
      t.string  :name_ar
      t.float   :registration_number
      t.date    :client_date
      t.string   :national_number
      t.string   :income_tax_number
      t.string   :sales_tax_number

      t.timestamps null: false
    end
    add_foreign_key :clients, :client_types
  end
end
