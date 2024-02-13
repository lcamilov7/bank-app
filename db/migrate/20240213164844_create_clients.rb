class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.integer :document_type
      t.string :document_number
      t.string :phone

      t.timestamps
    end
  end
end
