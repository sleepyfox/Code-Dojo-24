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

  it 'a list with two items in should return NOT_FOUND if the number searched for is not in the list', ->
    find([1, 2], 0).should.equal NOT_FOUND

  it 'a list with two items in should return 0 if the number searched for is the first item', ->
    find([1, 2], 1).should.equal 0

  it 'a list with two items in should return 1 if the number searched for is the second item', ->
    find([1, 2], 2).should.equal 1
 
describe 'When splitting a list', ->
  it 'an empty list should return two lists', ->
    split = (list) ->
      { firstList: [], secondList: [] }
    returnedObject = split([])
    returnedObject.firstList.should.be.a 'array'
    returnedObject.secondList.should.be.a 'array'
  it 'an empty list should return two empty lists', ->
    split = (list) ->
      { firstList: [], secondList: [] }
    returnedObject = split([])
    returnedObject.firstList.should.have.length 0
    returnedObject.secondList.should.have.length 0
