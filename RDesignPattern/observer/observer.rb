#エクセルのセルのような、一つの変更でほかのいろいろな場所に変更が及ぼされる場合
#Observerパターンを用いて内部に配列をもって対応する。
#それぞれのObserverはupdateメソッドを持つ必要がある。
#Observerモジュールとして別区切りにし、Mixinで含めるやり方が一般的。
#Ruby では require 'observer'を書き、class の中に
#include Observable を記述することで簡単にオブサーバを利用できる。
#その際、notify_observersの前にchangedメソッドを呼ぶことをお忘れなく。
#add_observerの引数にコードブロックを渡せば、
#各オブサーバクラスにupdateメソッドも必要なくなる。

class Employee
  attr_reader :name
  attr_accessor :title, :salary

  def initialize name, title, salary
    @name = name
    @title = title
    @salary = salary
    @observers = []
  end

  def salary= new_salary
    @salary = new_salary
    notify_observers
  end

  def notify_observers
    @observers.each do |observer|
      observer.update self
    end
  end

  def add_observer observer
    @observers << observer
  end
end

class Payroll
  def update changed_employee 
    puts "#{changed_employee.name} is upgrade!! Congratuations!!"
  end
end

class TaxMan
  def update changed_employee
    puts "#{changed_employee.name} was sent to new tax!"
  end
end

fred = Employee.new "Fred", "crane Operator", 200
fred.add_observer(Payroll.new)
fred.add_observer(TaxMan.new)
fred.salary = 100
