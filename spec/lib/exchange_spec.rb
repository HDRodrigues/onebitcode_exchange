require 'spec_helper'
require './lib/exchange'

describe Currency do
  it "exchange" do
    #Get the json in lib
    json = JSON.parse(File.read("./spec/fixtures/currency_list.json"))
    #Get 2 currency randomically
    currency, currency_destination = json['currency_list'].sample(2)

    quantity = rand(0..9999)


    value = Currency::exchange currency, currency_destination, quantity

    #Expect that the value is numeric
    expect(value.is_a? Numeric).to eql(true)
    expect(value != 0 || quantity == 0).to eql(true)

  end
end
