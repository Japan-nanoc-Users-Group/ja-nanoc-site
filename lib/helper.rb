# -*- coding: utf-8 -*-
def generate_page
  article_counter = sorted_articles.size.to_f
  page_counter = (article_counter / 7).ceil.to_i
  (1..page_counter).each do |i|
    page_stats = {:title => "#{i}ページ / #{sorted_articles.size}ページ中", :page_number => "#{i}", :max_page_number => "#{sorted_articles.size}"}
    option = {:binary => false}
    @items << Nanoc::Item.new("<%= render('_archives') %>", page_stats, "/news_archives/#{i}/", option)
  end
end

def pagination_bar
  html_source = ""
  counter = sorted_articles.size.to_i
  counter.times do |i|
    i += 1
    link = " [<a href='/news_archives/" + i.to_s + "/'>" + i.to_s + "</a>] "
    html_source << link
  end
  html_source
end
