class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.string           :title
      t.text             :plan
      t.datetime         :start_time
      t.references       :user
      t.references       :profile
      t.timestamps
    end
  end
end
