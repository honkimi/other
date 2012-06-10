require 'test/unit'
require './template'

class TestTemplate < Test::Unit::TestCase
  def setup
    @html = HTMLReport.new
    @text = TextReport.new
  end

  # やべ、これテスト書くまでもないな。。

end
