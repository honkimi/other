require './IEPage'

ie = IEPage.new("http://news.infoseek.co.jp/")


div = IEPage.make_elem(ie,"div")
ie.find.elem("form",0).elem("input",0).Value = "aiueo"
ie.find.elem("form",0).elem("input",3).click nil

p ie.find.methods
