class OmnicalcController < ApplicationController
  def home
    render({:template=>"pages_templates/home"})
  end
  def square
    render({:template=>"pages_templates/square/new"})
  end
  def square_results
    @number = params.fetch("number").to_f
    render({:template=>"pages_templates/square/results"})
  end
  def square_root
    render({:template=>"pages_templates/square_root/new"})
  end
  def square_root_results
    @number = params.fetch("number").to_f
    render({:template=>"pages_templates/square_root/results"})
  end
  def payment
    render({:template=>"pages_templates/payment/new"})
  end
  def payment_results
    @apr = params.fetch("apr").to_f
    @r = @apr/100/12
    @years = params.fetch("years").to_i
    @principal = params.fetch("principal").to_i
    @n=@years*12
    @numerator = @r*@principal
    @denominator = 1 - (1 + @r)**-@n
    @result = (@numerator/@denominator).to_fs(:currency, { :precision => 2 })
    render({:template=>"pages_templates/payment/results"})
  end
  def random
    render({:template=>"pages_templates/random/new"})
  end
  def random_results
    @minimum = params.fetch("minimum").to_f
    @maximum = params.fetch("maximum").to_f
    @random = rand(@minimum..@maximum)
    render({:template=>"pages_templates/random/results"})
  end
end
