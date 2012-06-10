#new するときに委譲したいもののオブジェクトのインスタンスを渡すのがポイント。
#Templateはアルゴリズムをひとたび選択すると変更が困難になる。
#委譲！
#コンテキストがいろんな種類のストラテジを利用する
#1つのメソッドで事足りるなら、Class使わずにProc,lambda ででも対応可能

class HTMLFormatter
  def output_report
    puts "HTML Format Output"
  end
end

class TextFormatter
  def output_report
    puts "Text Format Output"
  end
end

class Report
  def initialize formatter
    @title = "hoge"
    @text = "fuga"
    @formatter = formatter
  end

  def output_report
    @formatter.output_report(@title,@text)
  end
end

report = Report.new(HTMLFormatter.new)
report.output_report
