class AddNamesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name,      :string,       null: false
    add_column :users, :first_name_ruby, :string,       null: false
    add_column :users, :last_name,       :string,       null: false
    add_column :users, :last_name_ruby,  :string,       null: false
    add_column :users, :phone_number,    :string,       null: false
  end  
end
