class DefaultPostCounter < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :postscounter, 0
  end
end
