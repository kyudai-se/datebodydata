class AddIndexDate < ActiveRecord::Migration
  def change
    add_index :datebodydata, :date, :unique => true
  end
end
