# シンプルなコマンドであれば Procを使う。
# 複雑なコマンドであればコマンドのクラスを作り、
# そのインスタンスをコマンドとして保存する。


class Button
  attr_accessor :command

  def initialize &block
    @command = block
  end

  def on_button_push
    @command.call if @command
  end
end

new_button = Button.new do
  # some commands..
end



#  コマンドを記憶するコマンド
# Composite パターンとの併用でコマンド管理
# unexecute メソッドを実装しておくことで、元に戻すに対応できる

class Command 
  attr_reader :description

  def initialize description
    @description = description
  end

  def execute
  end
end

class CreateFile < Command
  def initialize path, contents
    super "Create file: #{path}"
    @path = path
    @contents = contents
  end

  def execute
    f = File.open(@path, "w")
    f.write(@contents)
    f.close
  end

  def unexecute
    File.delete(@path)
  end
end

class DeleteFile < Command
  def initialize path
    super "Delete file : #{path}"
    @path = path
  end
  
  def execute
    if File.exists? @path
      @contents = File.read @path
    end
    File.delete(@path)
  end

  def unexecute
    f = File.open(@path, "w")
    f.write(@contents)
    f.close
  end
    
end

class CompositeCommand < Command
  def initialize
    @commands = []
  end

  def add_command cmd
    @commands << cmd
  end

  def execute
    @commands.each{|cmd| cmd.execute}
  end

  def unexecute
    @commands.reverse_each{|cmd| cmd.unexecute}
  end

  def description
    description = ''
    @commands.each{|cmd| description += cmd.description+"\n"}
    description
  end
end

cmds = CompositeCommand.new

cmds.add_command(CreateFile.new('file1.txt', "hello world\n"))
cmds.add_command(DeleteFile.new('file1.txt'))

cmds.execute

puts cmds.description
