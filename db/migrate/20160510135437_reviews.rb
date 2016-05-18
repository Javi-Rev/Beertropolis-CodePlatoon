class Reviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string  :manufacturer
      t.string  :name
      t.string  :location #not in use currently, planned for potential feature !FLAG
      t.float   :price
      t.integer :rating
      t.text    :body
      t.integer :beer_id
      t.float   :latitude
      t.float   :longitude
      t.date    :review_date
    end
  end
end
