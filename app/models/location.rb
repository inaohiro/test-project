class Location < ApplicationRecord
  belongs_to :token

  def locate(value)
    hash = {
      :chiyoda => ["https://tenki.jp/forecast/3/16/4410/13101/10days.html", "千代田区"],
      :tyuuou => ["https://tenki.jp/forecast/3/16/4410/13102/10days.html", "中央区"],
      :minato => ["https://tenki.jp/forecast/3/16/4410/13103/10days.html", "港区"],
      :shinjyuku => ["https://tenki.jp/forecast/3/16/4410/13104/10days.html", "新宿区"],
      :bunkyo => ["https://tenki.jp/forecast/3/16/4410/13105/10days.html", "文京区"],
      :daitou => ["https://tenki.jp/forecast/3/16/4410/13106/10days.html", "台東区"],
      :sumida => ["https://tenki.jp/forecast/3/16/4410/13107/10days.html", "墨田区"],
      :etou => ["https://tenki.jp/forecast/3/16/4410/13108/10days.html", "江東区"],
      :sinagawa => ["https://tenki.jp/forecast/3/16/4410/13109/10days.html", "品川区"],
      :meguro => ["https://tenki.jp/forecast/3/16/4410/13110/10days.html", "目黒区"],
      :oota => ["https://tenki.jp/forecast/3/16/4410/13111/10days.html", "大田区"],
      :setagaya => ["https://tenki.jp/forecast/3/16/4410/13112/10days.html", "世田谷区"],
      :shibuya => ["https://tenki.jp/forecast/3/16/4410/13113/10days.html", "渋谷区"],
      :nakano => ["https://tenki.jp/forecast/3/16/4410/13114/10days.html", "中野区"],
      :suginami => ["https://tenki.jp/forecast/3/16/4410/13115/10days.html", "杉並区"],
      :toyosima => ["https://tenki.jp/forecast/3/16/4410/13116/10days.html", "豊島区"],
      :kita => ["https://tenki.jp/forecast/3/16/4410/13117/10days.html", "北区"],
      :arakawa => ["https://tenki.jp/forecast/3/16/4410/13118/10days.html", "荒川区"],
      :itabashi => ["https://tenki.jp/forecast/3/16/4410/13119/10days.html", "板橋区"],
      :nerima => ["https://tenki.jp/forecast/3/16/4410/13120/10days.html", "練馬区"],
      :adachi => ["https://tenki.jp/forecast/3/16/4410/13121/10days.html", "足立区"],
      :kasai => ["https://tenki.jp/forecast/3/16/4410/13122/10days.html", "葛飾区"],
      :edogawa => ["https://tenki.jp/forecast/3/16/4410/13123/10days.html", "江戸川区"],
      :huchushi- => ["https://tenki.jp/forecast/3/16/4410/13206/10days.html", "府中市"]
    }

    p hash[value]

  end

  locate(value)

end
