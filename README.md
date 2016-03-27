# NonShittyMovies
## Dynamic, mobile-friendly movie suggestion app

Author: Steven Olson

Live Version: [http://www.nonshittymovies.com/](http://www.nonshittymovies.com/)  

### Overview

This is a lightweight, single-purpose app built in Sinatra that dynamically provides movie suggestions. Data is scraped from a review aggregation site using Nokigiri + Mechanize, the code for which I extracted into the [FotoFetch Gem](https://github.com/SteveOscar/fotofetch), which pulls in images based on a given query term and dimension restrictions. 

### Suggestion Page
![Screenshot](http://i.imgur.com/jEJI9Uo.png)

