require 'open-uri'

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
    doc.css(".product_groups_module li.product").each do |item|
      film =  item.children.children.children.children.text.gsub(/[^a-z0-9\s]/i, '').split(" ")
      @movies << {title: film[0..-6].join(' '), score: film[-5], release_date: date_conversion(film[-2]) + film[-1]}
    end
    @movies
  end

end
