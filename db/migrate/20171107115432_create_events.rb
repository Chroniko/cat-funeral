class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.datetime :starts_at, null: false

      t.timestamps
    end
  end
end
