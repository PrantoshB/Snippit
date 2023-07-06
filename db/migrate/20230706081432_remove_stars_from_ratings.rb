class RemoveStarsFromRatings < ActiveRecord::Migration[7.0]
  def change
    change_table :ratings do |t|
      t.remove :stars 
    end
  end
end
