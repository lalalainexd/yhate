class AddStoriesTable < ActiveRecord::Migration

  def change
    create_table :stories do |t|
      t.timestamps
      t.datetime :occurred_at
      t.string :victims
      t.text :description
      t.string :link
    end
  end
end
