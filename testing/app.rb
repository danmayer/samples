class App

  def foo
    "a string"
  end

  def can_drink?(age)
    if age >= 21
      true
    else
      false
    end
  end

end

class SuperApp < App
end

SuperApp.new.foo
