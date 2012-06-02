re 'win32OLE'
ie = WIN32OLE.new("InternetExplorer.Application")
ie.Navigate("http://news.infoseek.co.jp/")

ie.Visible = true
while ie.Busy == true
  sleep 1
end

i=0
while 1
  begin
    li = ie.document.getElementById("specialListRCmp").getElementsByClassName('list').item(0).getElementsByTagName('li')
    li.item(i).getElementsByTagName('a').item(0).click nil
    sleep 1
    p ie.document.getElementById('topNewsCmp').getElementsByTagName('h3').item(0).innerHTML
    ie.GoBack
    sleep 1
    i+=1
  rescue
    break
  end
end


