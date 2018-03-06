class CreateNewsArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :news_articles do |t|
      t.string :author
      t.string :description
      t.datetime :date
      t.float :score
      t.string :sentiment
      t.string :source
      t.string :title
      t.string :url
      t.integer :coin_id
    end
  end
end
