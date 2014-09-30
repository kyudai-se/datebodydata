class AddColumnDate < ActiveRecord::Migration
  def change
    remove_column :datebodydata, :date, :datetime
    add_column    :datebodydata, :date, :date
  end
end
