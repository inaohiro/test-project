# coding utf-8

class Weather < ApplicationRecord

  def webscrape()

    # URLにアクセスするためのライブラリの読み込み
    require 'open-uri'
    # Nokogiriライブラリの読み込み
    require 'nokogiri'

    # スクレイピング先のURL
    url = 'https://tenki.jp/forecast/3/16/4410/13113/'

    charset = nil
    html = open(url) do |f|
    charset = f.charset # 文字種別を取得
    f.read # htmlを読み込んで変数htmlに渡す
    end

    # htmlをパース(解析)してオブジェクトを生成
    doc = Nokogiri::HTML.parse(html, nil, charset)

    # 今日と明日の日付(整形していません)
    doc.xpath('//h3[@class="left-style"]').each do |node|
      p node.inner_text
    end
    # 3~10日後の天気(整形していません)
    doc.xpath('//td[@class="cityday"]').each do |node|
      p node.inner_text
    end

    # 今日と明日の天気
    doc.xpath('//div[@class="weather-icon"]').each do |node|
      p node.css('img').attribute('title').value
    end

    # 3~10日後の天気
    doc.xpath('//td[@class="weather-icon"]').each do |node|
      p node.css('img').attribute('title').value
    end

  end

end
