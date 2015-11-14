class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer :client_id
      t.integer :files_primary_type_id
      t.integer :files_secondary_type_id

      t.timestamps null: false
    end
    add_foreign_key :connections, :clients
    add_foreign_key :connections, :files_primary_types
    add_foreign_key :connections, :files_secondary_types
  end
end
