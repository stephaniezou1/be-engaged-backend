class CreateHometowns < ActiveRecord::Migration[6.0]
  def change
    create_table :hometowns do |t|
      t.string :pollingLocations
      t.string :contests
      t.string :elections

      t.timestamps
    end
  end
end
