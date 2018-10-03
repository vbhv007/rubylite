require 'amalgalite'
# this is Functions
module Functions
  def exe(query)
    Rubylite.new.exec_this(@database, query)
  end

  def find_table_name
    (to_s + 's').downcase
  end

  def first(arg = 1)
    exe("select * from #{find_table_name} order by
       #{find_table_name}.id ASC limit #{arg}")
  end

  def take(arg = 1)
    exe("select * from #{find_table_name} limit #{arg}")
  end

  def last(arg = 1)
    exe("select * from #{find_table_name} order by
       #{find_table_name}.id DESC limit #{arg}")
  end

  def find_by(arg1, arg2)
    exe("select * from #{find_table_name} where
       (#{find_table_name}.#{arg1} = '#{arg2}') limit 1")
  end

  def all
    exe("select * from #{find_table_name}")
  end

  def making_query_from_hash(hash)
    hash.inject('') { |s, (k, v)| s + "#{k} = '#{v}', " }
  end

  def update(hash, condn_hash)
    str = making_query_from_hash(hash)
    condn = making_query_from_hash(condn_hash)
    exe("update #{find_table_name} set #{str[0..-3]} where #{condn[0..-3]}")
  end
end
