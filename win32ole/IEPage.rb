# -*- encoding: UTF-8 -*-

class IEPage
  require 'win32OLE'
  IE_APP = "InternetExplorer.Application"
  
  attr_accessor :doc, :ie
  
  #instance methods
  def initialize url
    @ie = WIN32OLE.new(IE_APP)
    go url
    @doc = @ie.document
  end
  
  #初期化。 ie.find. とつなげる規約。
  def find
    @doc = @ie.document
    self
  end
  
  def elem elem_name, item_num
    @doc = @doc.getElementsByTagName(elem_name).item(item_num)
    self
  end
  
  def name name, item_num
    @doc = @doc.getElementsByName(name).item(item_num)
    self
  end
  
  def id id_name
    @doc = @doc.getElementById(id_name)
    self
  end
  
  def html content
    if content
      @doc.appendChild(@ie.document.createTextNode(content))
    else
      @doc.innerHTML
    end
  end
  
  def add obj
    @doc.appendChild(obj.doc)
  end
  
  def attr name, value
    unless value
      @doc.getAttribute(name)
    else
      @doc.setAttribute(name, value)
    end
  end
  
  def methods search_word=nil
    mtds = @doc.ole_methods.map{|mtd| mtd.to_s}.sort
    mtds = mtds.grep search_word if search_word
    mtds
  end

  # クラスメソッドのほうがいいかな？
  def method name
    @ie.ole_method_help(name).params.each do |param|
      str = ""
      str.concat "[in] " if param.input?
      str.concat "[out] " if param.output?
      str.concat "[optional] " if param.optional?
      str.concat "[retval] " if param.retval?
      str.concat param.name
      str.concat " = #{param.default}" if param.default
      str.concat " As #{param.ole_type}"
      puts str
    end
  end
  
  def method_missing(method_name, *args)
    @doc.send(method_name, *args)
  end
  
  
  #class methods
  class << self
    def make_elem ie_obj, elem_name
      obj = ie_obj.clone
      obj.doc = ie_obj.ie.document.createElement(elem_name)
      obj
    end
  end

  #private methods
  private
  def go url, visible = true
    @ie.Navigate(url)
    @ie.Visible=visible
    wait
  end
  
  def wait
    while @ie.Busy == true
      sleep 1
    end
  end

end
