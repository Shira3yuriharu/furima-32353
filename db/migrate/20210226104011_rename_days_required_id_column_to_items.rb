class RenameDaysRequiredIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :days_required_id, :day_required_id
  end
end
