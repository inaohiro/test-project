# coding utf-8

class Weather < ApplicationRecord

  def webscrape()

  # 日付整形
    def shaping(s,n,m)
      s2 = s.split("")
      s3 = s2[n..m]
      s3.select!{ |item| item =~ /^[0-9日月火水木金土]/}
    end

    def scrape()
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

      date = Array.new
      weather = Array.new
      rainprobability = Array.new
  
      # 今日と明日の日付
      doc.xpath('//h3[@class="left-style"]').each do |node|
        s = node.inner_text
        s2 = shaping(s,3,11)
        if s2.empty? == false then
          date.push(s2)
        end
      end
      # 3~10日後の日付
      doc.xpath('//td[@class="cityday"]').each do |node|
        s = node.inner_text
        s2 = shaping(s,0,20)
        if s2.empty? == false then
          date.push(s2)
        end
      end

      # 今日と明日の天気
      doc.xpath('//div[@class="weather-icon"]').each do |node|
        s = node.css('img').attribute('title').value
        weather.push(s)
      end

      # 3~10日後の天気
      doc.xpath('//td[@class="weather-icon"]').each do |node|
        s = node.css('img').attribute('title').value
        weather.push(s)
      end
  
      # 今日と明日の降水確率(最大値)
      doc.xpath('//tr[@class="rain-probability"]').each do |node|
        s = node.inner_text
        s2 = s.split("\n      ")
        s4 = s2[2..5].map!{|item| item.delete("  ")}
        s4.delete("---")
        s4.map!{|item| item.delete("%")}.map!(&:to_i)
        rainprobability.push(s4.max)
      end
  
      # 3~10日後の降水確率
      doc.xpath('//p[@class="precip"]').each do |node|
        s = node.inner_text
        s.delete!("%").to_i
        rainprobability.push(s)
      end

      # ハッシュ作成
      hash = {}
      for i in 0..9 do
        data = [weather[i], rainprobability[i]]
        hash.store(date[i],data)
      end
      p hash
  
      end

    scrape()

    end

end
