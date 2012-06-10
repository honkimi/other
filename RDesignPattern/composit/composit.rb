#全体が部分のようにふるまう状況を表すパターン
#ツリーを利用するコードが１つのオブジェクトを扱ってるのか
#枝全体を扱っているのかを考えたくない場合に利用できる

class Task
  attr_reader :name

  def initialize name
    @name = name
  end

  def get_time_required
    0.0
  end
end

class HogeTask < Task
  def initialize
    super 'Add Hoge Task'
  end

  def get_time_required
    1.0
  end
end

class FugaTask < Task
  def initialize
    super 'Add Fuga Task'
  end

  def get_time_required
    3.0
  end
end


class CompositeTask < Task
  def initialize name
    super name
    @sub_tasks = []
  end
  
  def add_sub_task task
    @sub_tasks << task
  end

  def get_time_required
    time= 0.0
    #ここでeachするのが重要。再帰的に廻れるようになる
    @sub_tasks.each {|task| time += task.get_time_required}
    time
  end
end

class MakeTask < CompositeTask
  def initialize
    super 'Making'
    add_sub_task(HogeTask.new)
    add_sub_task(FugaTask.new)
  end
end

