class AddStageNumberToStages < ActiveRecord::Migration[7.0]
  def change
    add_column :stages, :stage_number, :integers
  end
end
