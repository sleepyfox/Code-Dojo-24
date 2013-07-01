should = require('chai').should()
NOT_FOUND = -1

describe 'A test suite', ->
  it 'true when tested should be truthy', ->
    true.should.be.true

  it '4 should be larger than 2', ->
    4.should.be.at.least 2

describe 'When finding a value in a list', ->
  it 'an empty list should return NOT_FOUND for any number searched for', ->
    find = (list, number) ->
      return NOT_FOUND
    find([]).should.equal NOT_FOUND