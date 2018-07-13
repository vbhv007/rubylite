require_relative 'functions.rb'
# this is class Rubylite
class Rubylite
  def db_open(db_name)
    @db = Amalgalite::Database.new "#{db_name}.db"
    @current_db = db_name
    make_class
  end

  def create(table_name, hash)
    str = make_query(hash)
    @db.execute("create table #{table_name.downcase}(#{str})")
    str2 = make_query2(hash)
    @db.execute("insert into #{table_name} values(#{str2})")
    db_name = @current_db
    db_close
    db_open(db_name)
  end

  def make_query2(hash)
    column = hash.inject('') { |col, (_k, value)| col + "'#{value}', " }
    column[0..-3]
  end

  def make_query(hash)
    column = hash.inject('') { |col, (key, _v)| col + "'#{key}', " }
    column[0..-3]
  end

  def exec_this(db_name, query)
    db_name.execute(query)
  end

  def db_close
    @current_db = ''
  end

  def make_class
    tables_list = exec_this(@db, "select name from sqlite_master where
       type='table'")
    tables_list.each do |table|
      @class_created = Object.const_set((table[0])[0..-2].capitalize, Class.new)
      @class_created.instance_variable_set(:@database, @db)
      @class_created.class_eval do
        extend Functions
      end
    end
  end

  def eval_this(input)
    instance_eval(input)
  end

  def code
    print "#{@current_db}>>"
    input = gets
    exit if input =~ /^q$/
    puts eval_this(input)
    code
  end
end
