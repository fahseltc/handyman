class AddNotesToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :notes, :text
  end
end
