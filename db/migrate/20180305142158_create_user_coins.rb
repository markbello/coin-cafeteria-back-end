class CreateUserCoins < ActiveRecord::Migration[5.1]
  def change
    create_table :user_coins do |t|
      t.references :user
      t.references :coin
    end
  end
end
