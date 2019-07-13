module Nilbogger
  def self.nil_try
    begin
      yield
    rescue
      return nil
    end
  end
end

fruit_colors = {banana: 'yellow', orange: 'orange', avocado: 'green'}
p fruit_colors[:banana].upcase  # => "YELLOW"
p fruit_colors[:apple]
p Nilbogger::nil_try{fruit_colors[:apple].upcase}
p fruit_colors[:apple].upcase