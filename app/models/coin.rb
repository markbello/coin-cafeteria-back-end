class Coin < ApplicationRecord
  has_many :user_coins
  has_many :users, through: :user_coins
  has_many :news_stories

  def fetch_news
    articles = get_articles(self.name, self.symbol, self.id)
    analyzed_articles = analyze_articles(articles)
    # analyzed_articles.sortBy(self.date)
  end

  # private

  def get_articles(name, symbol, id)
    #API instances
    newsapi = News.new("a53d6eac7ce54178bd0bcb9fd820d75c")


    current_articles = newsapi.get_everything(
      q: "#{name} AND #{symbol} AND cryptocurrency",
      from: '2017-02-14',
      language: 'en',
      sortBy: 'popularity',
      page: 1)

    current_article_instances = current_articles.map do |article|
      article_instance = NewsArticle.find_by(title: article.title)
      if !article_instance
        article_instance = NewsArticle.new(coin_id: self.id)
        article_instance.author = article.author
        article_instance.description = article.description
        article_instance.date = article.publishedAt
        article_instance.title = article.title
        article_instance.url = article.url
        article_instance.save
      end
      article_instance
    end

    analyze_articles(current_article_instances)
  end

  def analyze_articles(articles)
    watson = WatsonAPIClient::NaturalLanguageUnderstanding.new(user: 'b147c8bc-0bf4-434a-8939-4d5b2652f8a7', 'password': '6HslRoMb6XFt', 'version_date': '2017-02-27')
    articles
    coin_score = 0
    sentiment = ""
    begin

    articles.each do |article|
      if !article.score
          watson_data_res = watson.analyzeGet(url: article.url, version: '2017-02-27', features: 'sentiment')
          watson_data = JSON.parse(watson_data_res)


        article["score"] = watson_data["sentiment"]["document"]["score"]
        article.update(score: watson_data["sentiment"]["document"]["score"])

        article["sentiment"] = watson_data["sentiment"]["document"]["label"]
        article.update(sentiment: watson_data["sentiment"]["document"]["label"])
      end
      coin_score = coin_score + article.score
    end
    puts coin_score / articles.count
    if coin_score > 0
      sentiment = "positive"
    else
      sentiment = "negative"
    end

  rescue
    puts "whoopsie-doodle! something went wrong"
    articles
  end

    self.update(score: coin_score)
    self.update(sentiment: sentiment)
    articles

  end

end
