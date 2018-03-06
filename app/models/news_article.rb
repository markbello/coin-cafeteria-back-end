class NewsArticle < ApplicationRecord
  belongs_to :coin
  # attr_reader(:author) 
end
