class CreateShoppings < ActiveRecord::Migration[6.1]
  def change
    create_table :shoppings do |t|
      t.string :name

      t.timestamps
    end
  end
end
