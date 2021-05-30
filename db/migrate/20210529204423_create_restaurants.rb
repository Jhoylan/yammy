class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :shopping
      t.string :image_link

      t.timestamps
    end
  end
end
