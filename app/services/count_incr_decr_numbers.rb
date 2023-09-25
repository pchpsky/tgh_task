class CountIncrDecrNumbers
  def call(n)
    init_step = (0..9).map { [_1] }

    Enumerator
      .produce(init_step) { next_step(_1) }
      .take(n).sum { count(_1) }
      .then { _1 + 1 }
  end

  private

  def next_step(step)
    step.flat_map do |digits|
      digits.last.upto(9).map do |i|
        digits + [i]
      end
    end
  end

  def count(arr)
    arr.sum do |digits|
      next 0 if digits.all?(&:zero?)
      next 1 if digits.uniq.size == 1
      next 1 if digits.drop_while(&:zero?) != digits
      2
    end
  end
end
