class Counters < ActiveRecord::Migration[5.1]
  def change
    create_table :counters do |t|
	t.string :clicks
	t.integer :num_count
	t.timestamps
	end
  end
end
