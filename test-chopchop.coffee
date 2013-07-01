should = require('chai').should()

describe 'A test suite', ->
  it 'true when tested should be truthy', ->
    true.should.be.true

  it '4 should be larger than 2', ->
  	4.should.be.at.least 2
