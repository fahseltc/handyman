class DropOwnersTable < ActiveRecord::Migration
  def change
    drop_table :owners
  end
end
