class Nameable
  def initialize(forLinters = ''); end

  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
