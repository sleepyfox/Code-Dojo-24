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
  split = (list) ->
    if list.length is 0 or Array.isArray list isnt true
      { firstList: [], secondList: [] }
    else
      if list.length is 1 
        { firstList: list, secondList: [] }
      else
        splitIndex = Math.round(list.length / 2)
        { firstList: list[..splitIndex - 1], secondList: list[splitIndex..] }

  it 'an empty list should return two lists', ->
    returnedObject = split([])
    returnedObject.firstList.should.be.a 'array'
    returnedObject.secondList.should.be.a 'array'

  it 'an empty list should return two empty lists', ->
    returnedObject = split([])
    returnedObject.firstList.should.have.length 0
    returnedObject.secondList.should.have.length 0

  it 'a list with one item in should return the list as the firstList', ->
    returnedObject = split([1])
    returnedObject.firstList.should.have.length 1
    returnedObject.firstList[0].should.equal 1

  it 'a list with two items in should return the first and second items as 1 item lists', ->
    returnedObject = split([1, 2])
    returnedObject.firstList.should.be.a 'array'
    returnedObject.firstList.should.have.length 1
    returnedObject.firstList[0].should.equal 1
    returnedObject.secondList.should.be.a 'array'
    returnedObject.secondList.should.have.length 1
    returnedObject.secondList[0].should.equal 2

  it 'a list with three items in should return the first and second items in the first lists', ->
    returnedObject = split([1, 2, 3])
    returnedObject.firstList.should.be.a 'array'
    returnedObject.firstList.should.have.length 2
    returnedObject.firstList[0].should.equal 1
    returnedObject.firstList[1].should.equal 2
    
  it 'a list with three items in should return the third item in the second list', ->
    returnedObject = split([1, 2, 3])
    returnedObject.secondList.should.be.a 'array'
    returnedObject.secondList.should.have.length 1
    returnedObject.secondList[0].should.equal 3

