class Solver
  def factorial(num)
    raise ArgumentError, "Can't calculate factorial for negative numbers" if num.negative?
    return 1 if num <= 1

    num * factorial(num - 1)
  end
end
