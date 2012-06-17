require 'net/http'

pages = %w{www.rubycentral.com slashdot.org www.google.com}
threads = []

pages.each do | page |
  threads << Thread.new(page) do |url|
    h = Net::HTTP.new(url, 80)
    puts "Fetching: #{url}"
    rasp = h.get('/', nil)
    puts "Got #{url}: #{rasp.message}"
  end
end

threads.each{|thr| thr.join}
