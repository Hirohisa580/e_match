class CreateUserDms < ActiveRecord::Migration[6.0]
  def change
    create_table :user_dms do |t|
      t.references     :user,    foreign_key: true
      t.references     :dm,      foreign_key: true
      t.timestamps
    end
  end
end
