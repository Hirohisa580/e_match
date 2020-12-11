class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string         :nickname,         null: false
      t.string         :age
      t.date           :birthday             
      t.integer        :area_id,           null: false
      t.integer        :genre_one_id,      null: false
      t.integer        :genre_two_id
      t.integer        :genre_three_id
      t.string         :history
      t.text           :public_relation,   null: false
      t.references     :user,              foreign_key: true
      t.timestamps
    end
  end
end