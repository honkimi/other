class MyClass
  p self # -> MyClass
  def self.my_accessor name
    p self #-> MyClass
    define_method "#{name}=" do |v|
        p self  #-> #<MyClass: >
        @name = v
    end
    define_method "#{name}" do
        @name
    end
  end

  def test
    p self  #-> #<MyClass: >
  end
  my_accessor :mine
end

my = MyClass.new
my.mine = "hoge"
p my.mine
