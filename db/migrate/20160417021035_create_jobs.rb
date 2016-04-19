class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.text :description
      t.text :location

      t.timestamps null: false
    end
  end
end
