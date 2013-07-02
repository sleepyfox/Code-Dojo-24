should = require('chai').should()
NOT_FOUND = -1

split = (list) ->
  if list.length is 0 or Array.isArray list isnt true
    { firstList: [], secondList: [] }
  else
    if list.length is 1 
      { firstList: list, secondList: [] }
    else
      splitIndex = Math.round(list.length / 2)
      { firstList: list[..splitIndex - 1], secondList: list[splitIndex..] }

find = (list, number) ->
  if Array.isArray(list) isnt true
    return NOT_FOUND
  if (list.length is 0) or (number < list[0]) or (number > list[list.length-1])
    return NOT_FOUND
  else
    if list.length is 1
      if list[0] is number 
        return 0
      else
        return NOT_FOUND
    else
      return binarySearch(list, number, 0)

binarySearch = (list, number, offset) ->
  #list.indexOf number or NOT_FOUND
  if list.length is 1 # tail recursion guard clause
    if list[0] is number
      return offset
    else
      return NOT_FOUND
  else
    returnedObject = split(list)
    if returnedObject.secondList[0] <= number # must be in second list
      binarySearch(returnedObject.secondList, number, offset + Math.round(list.length/2))
    else # must be in first list
      binarySearch(returnedObject.firstList, number, offset)


describe 'When finding a value in a list', ->    
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

  it 'a list with three items in that does not contain the number should return NOT_FOUND', ->
    find([1, 2, 3], 4).should.equal NOT_FOUND
 
  it 'a list with three items in should return 1 if the number searched for is the second item', ->
    find([1, 2, 3], 2).should.equal 1

  it 'a list with seven items in should return 5 if the number looked for is in the 5th place', ->
    find([1, 3, 5, 6, 7, 8, 12], 8).should.equal 5


describe 'When splitting a list', ->
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

  it 'a list with three items in should return the first and second items in the first list', ->
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

  it 'a list with four items in should return the first and second items in the first list', ->
    returnedObject = split([1, 2, 3, 4])
    returnedObject.firstList.should.be.a 'array'
    returnedObject.firstList.should.have.length 2
    returnedObject.firstList[0].should.equal 1
    returnedObject.firstList[1].should.equal 2
    
  it 'a list with four items in should return the third and fourth items in the second list', ->
    returnedObject = split([1, 2, 3, 4])
    returnedObject.secondList.should.be.a 'array'
    returnedObject.secondList.should.have.length 2
    returnedObject.secondList[0].should.equal 3
    returnedObject.secondList[1].should.equal 4

