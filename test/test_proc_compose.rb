require 'test/unit'

class TestProcCompose < Test::Unit::TestCase
  def test_proc_compose
    f = Proc.new{|x| x + 1 }
    g = Proc.new{|x| x * x }

    assert_equal g.compose(f).call(1), g.call(f.call(1))
    assert_equal((g << f ).call(1), g.call(f.call(1)))
    assert_equal g.compose{|x| x + 3 }.call(1), 16
  end

  def test_proc_and_then
    f = Proc.new{|x| x + 1 }
    g = Proc.new{|x| x * x }

    assert_equal((g >> f ).call(1), f.call(g.call(1)))
  end

  def test_lambda_compose
    f = ->(x) { x + 1 }
    g = ->(x) { x * x }

    assert_equal g.compose(f).call(1), g.call(f.call(1))
    assert_equal((g << f ).call(1), g.call(f.call(1)))
    assert_equal g.compose{|x| x + 3 }.call(1), 16
  end

  def test_lambda_and_then
    f = ->(x) { x + 1 }
    g = ->(x) { x * x }

    assert_equal((g >> f ).call(1), f.call(g.call(1)))
  end
end
