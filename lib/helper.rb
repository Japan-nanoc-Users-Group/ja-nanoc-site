# -*- coding: utf-8 -*-
def generate_page
  counter = sorted_articles.size.to_f
  archives_counter = (counter / 7).ceil.to_i
  (1..archives_counter).each do |i|
    page_stats = {:title => "#{i}ページ / #{archives_counter}ページ中", :page_number => "#{i}", :max_page_number => "#{archives_counter}}"}
    option = {:binary => false}
    @items << Nanoc::Item.new("<%= render('_archives') %>", page_stats, "/news_archives/#{i}/", option)
  end
end

def pagination_bar
  html_source = ""
  counter = sorted_articles.size.to_i
  archives_counter = (counter.to_f / 7).ceil.to_i
  archives_counter.times do |i|
    i += 1
    link = " [<a href='/news_archives/" + i.to_s + "/'>" + i.to_s + "</a>] "
    html_source << link
  end
  html_source
end
