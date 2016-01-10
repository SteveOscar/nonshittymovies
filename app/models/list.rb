require 'open-uri'
require 'mechanize'
require 'pry'

class List

  def date_conversion(month)
    num = '01' if month == "Jan"
    num = '02' if month == "Feb"
    num = '03' if month == "Mar"
    num = '04' if month == "Apr"
    num = '05' if month == "May"
    num = '06' if month == "Jun"
    num = '07' if month == "Jul"
    num = '08' if month == "Aug"
    num = '09' if month == "Sep"
    num = '10' if month == "Oct"
    num = '11' if month == "Nov"
    num = '12' if month == "Dec"
    num
  end

  def fetch_movies
    @movies = []
    url = "http://www.metacritic.com/browse/movies/release-date/theaters/date"
    doc = Nokogiri::HTML(open(url, "User-Agent" => "Mozilla/5.0 (Windows NT 6.0; rv:12.0) Gecko/20100101 Firefox/12.0 FirePHP/0.7.1"))
    scrape(doc)
    @movies[0..25]
  end

  # the discontinued hotlinking poster scraper...
  # def fetch_poster(film)
  #   @links = []
  #   agent = Mechanize.new
  #   page = agent.get("http://www.bing.com/images/search?q=#{film.gsub(' ', '+')}+movie+2015")
  #   page.links.each { |link| @links << link.href }
  #   link = (@links.select { |a| a.include?(".jpg") })[0..7].first
  # end

  def fetch_poster(film)
    "/images/#{film.downcase.gsub(' ', '-')}.jpg"
  end


  def scrape(doc)
    doc.css(".product_groups_module li.product").each do |item|
      film =  item.children.children.children.children.text.gsub(/[^a-z0-9\s]/i, '').split(" ")
      @movies << {title: film[0..-6].join(' '), score: film[-5], release_date: date_conversion(film[-2]) + film[-1]}
    end
  end

  def best_in_theaters
    @movies = (fetch_movies).delete_if {|hash| hash[:score] == "tbd"}
    @movies.sort_by { |hsh| hsh[:score] }.reverse
  end

  def best_new_release
    @movies = (fetch_movies).delete_if {|hash| hash[:score] == "tbd"}
    @movies.sort_by { |hsh| hsh[:release_date] }.reverse
    @date = @movies.first[:release_date]
    @movies[0..5].sort_by { |hsh| hsh[:score] }.reverse
  end

  def comment(movie)
    comment = great.sample if movie[:score].to_i >= 85
    comment = good.sample if movie[:score].to_i >= 70 && movie[:score].to_i < 85
    comment = mediocre.sample if movie[:score].to_i < 70
    comment
  end

  def great
    ["is fucking great.", "is seriously good.", "is the best movie playing.", "is a cinematic orgasm"]
  end

  def good
    ["is pretty goddam decent.", "should keep you off your phone.", "is worth putting pants on for."]
  end

  def mediocre
    ["is... fairly unshitty.", "beats boredom, at least.", "ain't a classic, but it'll do."]
  end

end
