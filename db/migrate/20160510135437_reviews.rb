class Reviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string  :manufacturer
      t.string  :name
      t.float   :price
      t.integer :rating
      t.text    :body
      t.integer :beer_id
      t.float   :latitude
      t.float   :longitude

      t.timestamps null: false
    end
  end
end
