class CreateDatebodydata < ActiveRecord::Migration
  def change
    create_table :datebodydata do |t|
      t.datetime "date"
      t.decimal  "weight"
      t.timestamps
    end
  end
end
