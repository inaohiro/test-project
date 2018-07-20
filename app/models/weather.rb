# coding utf-8

class Weather < ApplicationRecord

  def webscrape()
	# ウェブスクレイピング元データ1
        def setother(doc,other)
        	arr = Array.new
        	doc.xpath('//td').each do |node|
            		s = node.inner_text
            		arr.push(s)
        	end
        	other = arr
    	end
    	# ウェブスクレイピング元データ2の整形
    	def setother2(doc,other2)
        	arr = Array.new
        	doc.xpath('//th').each do |node|
            		s = node.inner_text
            		s.gsub!(/\n    /,'')
            		s.gsub!(/\n  /,'')
            		arr.push(s)
        	end
        	other2 = arr[7..31]+arr[46..70]
    	end

	def getplace(doc)
		doc.xpath("//ol[@class='breadcrumb-navi clearfix']/li[4]/a/span").inner_text
	end

    	#日付と曜日取得
    	def getdate(other2,date,day_of_the_week)

        	for i in 0..9 do
            		date[i]=other2[5*i]
        	end

        	for i in 0..9 do
             		date[i].sub!(/月/,'/')
             		date[i].sub!(/日/,'')
             		day_of_the_week.push(date[i][-2])
             		date[i].slice!(-3..-1)
            		if date[i][0] == "0" then
                		date[i].slice!(0)
            		end
        	end
    	end

    	#降水量取得
    	def getrainprobability(other2,rainprobability)
        	for i in 0..9 do
            		rainprobability[i]=other2[5*i+3].delete("%").to_i
        	end
    	end

    	#天気(午前午後)取得
    	def getweather(other,weatherAM,weatherPM)
        	for i in 0..39 do
        		if i%4 == 1 then
        	        	weatherAM.push(other[i*7+1])
        	    	elsif i%4 == 2 then
                		weatherPM.push(other[i*7+1])
        	    	end
        	end
    	end

    	#本体
    	def scrape()
        	# URLにアクセスするためのライブラリの読み込み
        	require 'open-uri'
        	# Nokogiriライブラリの読み込み
        	require 'nokogiri'
        	# スクレイピング先のURL
        	url = 'https://tenki.jp/forecast/3/16/4410/13113/10days.html'

        	charset = nil
        	html = open(url) do |f|
        		charset = f.charset # 文字種別を取得
            		f.read # htmlを読み込んで変数htmlに渡す
        	end

        	# htmlをパース(解析)してオブジェクトを生成
        	doc = Nokogiri::HTML.parse(html, nil, charset)

        	other = Array.new
        	other2 = Array.new

        	date = Array.new(10)
        	day_of_the_week = Array.new
        	weatherAM= Array.new
        	weatherPM= Array.new
        	rainprobability = Array.new

        	other = setother(doc,other)
        	other2 = setother2(doc,other2)

		place = getplace(doc)
       		getdate(other2,date,day_of_the_week)
        	getrainprobability(other2,rainprobability)

        	getweather(other,weatherAM,weatherPM)

        	# ハッシュ作成
        	data = Array.new
        	for i in 0..9 do
            		data[i]={}
            		data[i]["date"]=date[i]
            		data[i]["day_of_the_week"]=day_of_the_week[i]
            		data[i]["weatherAM"]=weatherAM[i]
            		data[i]["weatherPM"]=weatherPM[i]
            		data[i]["rainprobability"]=rainprobability[i]
        	end

		data.push(place)
        	p data

    	end

    	scrape()
    
  	end

end
