class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.references :Shopping, null: false, foreign_key: true
      t.string :name
      t.string :image_link

      t.timestamps
    end
  end
end
