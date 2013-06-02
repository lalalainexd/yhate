class AddBiasToStories < ActiveRecord::Migration
  def change
    add_column :stories, :bias, :string
  end
end
