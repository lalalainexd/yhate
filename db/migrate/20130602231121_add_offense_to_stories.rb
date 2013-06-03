class AddOffenseToStories < ActiveRecord::Migration
  def change
    add_column :stories, :offense, :string
  end
end
