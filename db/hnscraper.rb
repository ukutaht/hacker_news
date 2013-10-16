require 'nokogiri'
require 'open-uri'
 
 
class Scraper
  def initialize(path)
    @doc = Nokogiri::HTML(open(path))
  end
 
  def find_post
    post_attributes = Hash.new
    post_attributes[:title] =  @doc.css('.title a').text
    post_attributes[:url] = @doc.css('.title a').attribute("href").text
    return post_attributes
  end
 
  def find_comments
    all_comments = []
    comments = @doc.css('td.default')
    comments.each do |comment|
      comment_attributes = Hash.new
      comment_attributes[:content] = comment.css('span.comment').text
      all_comments << comment_attributes
    end
    return all_comments
 end
end
 
