# -*- coding: utf-8 -*-
def generate_page
  article_counter = sorted_articles.size.to_f
  page_counter = (article_counter / 7).ceil.to_i
  (1..page_counter).each do |i|
    page_stats = {:title => "#{i}ページ / #{sorted_articles.size}ページ中", :page_number => "#{i}"}
    option = {:binary => false}
    @items << Nanoc::Item.new("<%= render('_archives') %>", page_stats, "/news_archives/#{i}/", option)
  end
end

def pagination_bar
  article_counter = sorted_articles.size
  page_counter = (article_counter.to_i / 7).ceil
  page_number = @item[:page_number]

  html_source = ""
  if page_counter < 10
    sub_html_source = ""
    (1..page_counter).each do |i|
      sub_html_source << " <a href='/news_archives/#{i}/'>#{i}</a> "
    end
    html_source = "<p>#{sub_html_source}</p>"
  elsif page_counter > 9
    
  end

end
