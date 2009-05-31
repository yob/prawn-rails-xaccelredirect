# dummy model. Avoids this sample app needing a DB or activerecord
#
class Product
  attr_accessor :id, :code, :description, :rrp

  def self.all(*arg)
    [
      Product.new(:id => 1, :code => "9781921421143", :description => "Heaven and Earth", :rrp => 10),
      Product.new(:id => 2, :code => "9780552997775", :description => "Sparrow", :rrp => 29.95),
      Product.new(:id => 3, :code => "9780552998116", :description => "Children of God", :rrp => 19.95),
      Product.new(:id => 4, :code => "9780765302304", :description => "Gathering Storm", :rrp => 19.95)
    ]
  end

  def self.find(id)
    self.all[id.to_i - 1]
  end

  def initialize(params = {})
    params.each do |key, value|
      self.__send__("#{key}=", value)
    end
  end

  def to_param
    self.id.to_s
  end
end
