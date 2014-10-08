class AddColumnBodyBloodPressure < ActiveRecord::Migration
  def change
    add_column :datebodydata, :bloodpressure, :decimal
  end
end
