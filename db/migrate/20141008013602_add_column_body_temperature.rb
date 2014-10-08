class AddColumnBodyTemperature < ActiveRecord::Migration
  def change
    add_column :datebodydata, :bodytemperature, :decimal
  end
end
