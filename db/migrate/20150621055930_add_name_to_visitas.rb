class AddNameToVisitas < ActiveRecord::Migration
  def change
    add_column :visita, :name, :string
  end
end
