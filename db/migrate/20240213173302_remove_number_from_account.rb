class RemoveNumberFromAccount < ActiveRecord::Migration[7.1]
  def change
    remove_column :accounts, :number, :integer
  end
end
