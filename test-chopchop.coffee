should = require('chai').should()
NOT_FOUND = -1

describe 'When finding a value in a list', ->
  find = (list, number) ->
    if list.length? is 0 
      return NOT_FOUND
    else
      return list.indexOf number

  it 'an empty list should return NOT_FOUND for any number searched for', ->
    find([]).should.equal NOT_FOUND

  it 'a list with one item in should return NOT_FOUND if it does not contain the item', ->
    find([0], 1).should.equal NOT_FOUND

  it 'a list with one item in should return 0 if it contains the item', ->
    find([1], 1).should.equal 0

