class RemoveCountryFromLocations < ActiveRecord::Migration
  def change
    remove_column :locations, :country, :string
  end
end
