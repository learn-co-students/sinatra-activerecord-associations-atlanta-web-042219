class AddColumnToCats < ActiveRecord::Migration
  def change
    remove_column :cats, :owner_id
  end
end
