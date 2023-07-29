class RemoveUserIdFromBook < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :name, :integer
    add_column :books, :user_id, :integer
  end
end
