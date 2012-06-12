Win32OLE Mapper for IE
=====
This library enable you to manipurate InternetExplore easily using Ruby.
In your work, you have many borning tasks that you have to do as a routine work.
I hope that you improve your jobs and take the great life!

Usage
=====
require this file and create ie object.
<pre>
require './lib/IEPage'
ie = IEPage.new("http://google.com")
</pre>

You can access document like DOM.
Make sure that you need to call "find" method at the first.
The method initialize the current dom object.
<pre>
ie.find.name('Text',0) #=> getElementsByName("Text").item(0)
ie.find.id("container") #=> getElementById("container")
ie.find.tag("table",2) #=> getElementsByTagName("table").itemn(2)
</pre>

We support "Saved Access" which hold the current dom object.
<pre>
tr = ie.find.tag('table',12).tag('tr',1)
tr.sa.tag('td',1)
tr.sa.tag('td',2)
...
</pre>

Other convinient methods.
<pre>
ie.wait
ie.close
ie.back
ie.go(url)
ie.tag('tr').each....
ie.id('hoge').html
ie.id('sbmt_btn').click
</pre>

You can also add some elements.
<pre>
div = IEPage.make_elemn(ie, "div")
div.value = "test"
div.attr("id", "item")
ie.id('list').add(div)
</pre>

For debugging.
methods method output the all of the Win32OLE methods.
<pre>
ie.methods
ie.methods(/^on/)
ie.method("Click")
</pre>

You can use origin Win32OLE method.
<pre>
ie.getElementById(...) 
</pre>
You can search the methods by using "methods, method" method.

