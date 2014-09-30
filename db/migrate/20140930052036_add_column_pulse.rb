class AddColumnPulse < ActiveRecord::Migration
  def change
      add_column :datebodydata, :pulse, :decimal
  end
end
