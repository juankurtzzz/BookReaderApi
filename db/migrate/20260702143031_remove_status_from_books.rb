class RemoveStatusFromBooks < ActiveRecord::Migration[8.1]
  def change
    remove_column :books, :status, :string
  end
end
