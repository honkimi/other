class Bad
  def report (format)
    if format == "html"
      puts "<html>"
      puts "<head>"
      puts "<title>wa-i</title>"
      puts "</head>"
      puts "<body>"
      puts "hahaha"
      puts "</body>"
      puts "</html>"
    elsif format == "text"
      puts "Title:"
      puts "wa-i"
      puts "Content:"
      puts "hahaha"
    end
  end
end

class Good
  def report
    before_report
    head_report
    body_report
    after_report
  end
  def before_report
  end
  def head_report
    puts "default head"
  end
  def body_report
    puts "default body"
  end
  def after_report
  end
end

class HTMLReport < Good
  def before_report
    puts "<html>"
  end
  def head_report
    puts "<head>"
    puts "wa-i"
    puts "</head>"
  end
  def body_report
      puts "<body>"
      puts "hahaha"
      puts "</body>"
  end
  def after_report
    puts "</html>"
  end
end

class TextReport < Good
  def head_report
    puts "Title:"
    puts "wa-i"
  end
  def body_report
    puts "Content:"
    puts "hahaha"
  end
end
