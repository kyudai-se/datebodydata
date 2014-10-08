class AddColumnBodyHighBloodPressure < ActiveRecord::Migration
  def change
    add_column :datebodydata, :highbloodpressure, :decimal
  end
end
