class Reviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string  :manufacturer
      t.string  :name
      t.string  :location
      t.float   :price
      t.integer :rating
      t.text    :body
      t.integer :beer_id
    end
  end
end
