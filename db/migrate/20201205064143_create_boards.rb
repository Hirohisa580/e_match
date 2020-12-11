class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.string        :name,           null: false
      t.integer       :genre_one_id,   null: false
      t.text          :explanation,    null: false
      t.references    :profile,        foreign_key: true
      t.references    :user,           foreign_key: true
      t.boolean       :checked
      t.timestamps
    end
  end
end
