module Nilbogger
  @@errors = []

  def self.errors
    @@errors
  end

  def self.nil_try(return_value = nil)
    begin
      yield
    rescue NoMethodError
      return return_value
    rescue => e
      @@errors << e
      return e
    end
  end

  def self.try(return_value = '.')
    begin
      yield
    rescue => e
      @@errors << e
      return return_value == '.' ? e : return_value
    end
  end
end
