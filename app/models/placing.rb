class Placing
attr_accessor :name, :place

  def initialize(params)
    @name = params[:name] if !params[:name].nil?
    @place = params[:place] if !params[:place].nil?
  end

  def mongoize
    {
      :name => @name,
      :place => @place
    }
  end

  def self.mongoize object
    case object
      when nil then nil
      when Hash then object
      when Placing then object.mongoize
    end
  end

  def self.demongoize object
    case object
      when nil then nil
      when Hash then Placing.new(object)
      when Placing then Placing
    end
  end

  def self.evolve object
    case object
      when nil then nil
      when Hash then object
      when Placing then object.mongoize
    end
  end


end
