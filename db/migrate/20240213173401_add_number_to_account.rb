class AddNumberToAccount < ActiveRecord::Migration[7.1]
  def change
    add_column :accounts, :number, :string
  end
end
