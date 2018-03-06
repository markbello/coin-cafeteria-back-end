class ArticlesController < ApplicationController

  def show
    puts params
    @coin = Coin.find_by(symbol: params[:id].upcase)
    puts @coin
    @articles = @coin.fetch_news
    @articles.sort_by!{|article| article.date}
    @articles.reverse!
    render json:@articles
  end

end
