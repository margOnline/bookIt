class RenameRessourceToResource < ActiveRecord::Migration
  def change
    rename_column :bookings, :ressource_id, :resource_id
  end
end
