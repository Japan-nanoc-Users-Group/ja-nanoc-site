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

def breadcrumbs
  tag = '<ul class="breadcrumb">'
  breadcrumbs_trail.each do |item|
    if item == nil
    elsif item.identifier == "/"
      tag += '<li><a href="/">トップ</a> <span class="divider">/</span></li>'
    elsif item.identifier == @item.identifier && item.identifier[0..5] == "/news/"
      tag += '<li><a href="/news_archives/1/">News</a> <span class="divider">/</span></li>'
      tag += '<li class="active">' + item[:title] + '</li>'
    elsif item.identifier == @item.identifier
      tag += '<li class="active">' + item[:title] + '</li>'
    else
      tag += '<li><a href="' + item.identifier + '">' + item[:title] + '</a>  <span class="divider">/</span></li>'
    end
  end
  tag += '</ul>'
end
