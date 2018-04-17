# mocha --compilers coffee:coffee-script/register
# mocha --require coffee-script/register "test/**/*.{js,coffee}"

# describe 'Task instance', ->
# 	it 'should add two numbers', ->
# 		(2+2).should.equal 4

assert = require('chai').assert

# import {Task, Bear} from '../src/task'
task = require '../src/task'

describe 'testing', ->

  it 'is pretty nice with CoffeeScript', ->
    assert 4+4 == 8

describe 'external test', ->

	it 'should import properly', ->
		assert.equal task.hello, 'hello'

	it 'should return the name properly', ->
		grizly = new task.Bear('Grizly')
		assert.equal grizly.name, 'Grizly'
	it 'should return Grizly the bear attacks with his bare paws!', ->
		grizly = new task.Bear('Grizly')
		assert.equal grizly.attack(), 'Grizly the bear attacks with his bare paws!'