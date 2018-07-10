require 'amalgalite'
# this is DB
module Functions
  def exe(query)
    RQuery.new.exec_this(@database, query)
  end

  def first(arg = 1)
    exe("select * from #{to_s.downcase} order by
       #{to_s.downcase}.id ASC limit #{arg}")
  end

  def take(arg = 1)
    exe("select * from #{to_s.downcase} limit #{arg}")
  end

  def last(arg = 1)
    exe("select * from #{to_s.downcase} order by
       #{to_s.downcase}.id DESC limit #{arg}")
  end

  def find_by(arg1, arg2)
    exe("select * from #{to_s.downcase} where
       (#{to_s.downcase}.#{arg1} = '#{arg2}') limit 1")
  end

  def all
    exe("select * from #{to_s.downcase}")
  end

  def update(hash, condn_hash)
    str = hash.inject('') { |s, (k, v)| s + "#{k} = '#{v}', " }
    condn = condn_hash.inject('') { |s, (k, v)| s + "#{k} = '#{v}', " }
    exe("update #{to_s.downcase} set #{str[0..-3]} where #{condn[0..-3]}")
  end
end
