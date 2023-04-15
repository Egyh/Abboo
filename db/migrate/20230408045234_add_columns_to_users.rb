class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
     add_column :users, :introduction, :text
     add_column :users, :country_code, :string, default: "JP"
     add_column :users, :abroad_record, :string
     add_column :users, :purpose, :string
     add_column :users, :period, :string
     add_column :users, :is_deleted, :boolean, default: false, null: false

  end
end
