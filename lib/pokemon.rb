require "pry"
class Pokemon
    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(db)
        @id = id
        @name = name
        @type = type
        @db = db
    end

      def self.save (name,type,db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?);
        SQL
        db.execute(sql, name, type)
        @id = db.execute("SELECT name FROM pokemon")[0][0]
      end 
 
    
      def self.find(name,type)
        
        sql = <<-SQL
        SELECT * FROM pokemon WHERE id = ?
        SQL

        result = @id.execute(sql,@id)
        Pokemon.new(result[0], result[1], result[2])
      end

end
