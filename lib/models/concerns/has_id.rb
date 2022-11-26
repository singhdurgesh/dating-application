# HasId concern

module HasId
  def self.included(klass)
    klass.extend(ClassMethods)

    attr_accessor :id
  end

  # Class methods

  module ClassMethods
    def all
      @all ||= {}
    end

    def id_for_new_record
      @id ||= 0
      @id += 1
    end

    def find_by_id(id)
      @all[id]
    end
  end

  # Instance Methods

  def initialize(_options = {})
    @id = self.class.id_for_new_record
    self.class.all[id] = self
  end
end
