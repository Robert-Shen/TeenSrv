class AddLongAndLatToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :latitude, :float
    add_column :clients, :longitude, :float
  end
end
