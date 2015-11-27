class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.integer :filer_id
      t.string  :order
      t.text    :notes

      t.timestamps null: false
    end
    add_foreign_key :papers, :filers
    add_attachment  :papers, :url
  end
end
