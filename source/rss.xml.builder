xml.instruct!
site_url = "http://kyleshank.com"
xml.rss "version" => "2.0" do
  xml.channel do
    xml.title "Kyle Shank"
    xml.description "What goes up must come down"
    xml.link site_url
    xml.pubDate(blog.articles.first.date.to_time.rfc822) unless blog.articles.empty?
    xml.language "en-US"

    blog.articles[0..20].each do |article|
      xml.item do
        xml.title article.title
        xml.link URI.join(site_url, article.url)
        xml.guid URI.join(site_url, article.url)
        xml.pubDate article.date.to_time.rfc822
        xml.description article.body
      end
    end
  end
end
