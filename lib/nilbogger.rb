module Nilbogger
  def self.nil_try(return_value = nil)
    begin
      yield
    rescue
      return return_value
    end
  end
end