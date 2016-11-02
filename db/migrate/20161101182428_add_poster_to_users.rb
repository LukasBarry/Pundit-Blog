class AddPosterToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :poster, :boolean
  end
end
