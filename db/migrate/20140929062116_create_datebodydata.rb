class CreateDatebodydata < ActiveRecord::Migration
  def change
    create_table :datebodydata do |t|

      t.timestamps
    end
  end
end
