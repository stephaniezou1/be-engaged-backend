class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.references :user, null: false, foreign_key: true
      t.references :election, null: false, foreign_key: true

      t.timestamps
    end
  end
end
