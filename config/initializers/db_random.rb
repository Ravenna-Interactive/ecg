module ActiveRecord::ConnectionAdapters
  
  class MysqlAdapter
    
    def random_function
      "RAND()"
    end
    
  end
  
  class SQLiteAdapter
    
    def random_function
      "Random()"
    end
    
  end
  
end