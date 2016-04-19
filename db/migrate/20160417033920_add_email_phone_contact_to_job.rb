class AddEmailPhoneContactToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :email, :string
    add_column :jobs, :phone, :string
    add_column :jobs, :contact_info, :text
  end
end
