# mocha --compilers coffee:coffee-script/register
# mocha --require coffee-script/register "test/**/*.{js,coffee}"

assert = require('chai').assert
expect = require('chai').expect
should = require('chai').should()

# import { Bear } from '../src/task.coffee'
# import '../src/task.coffee'
# import {Task, Bear} from '../src/task'
Bear = require('../src/task').Bear

describe 'testing', ->

  it 'is pretty nice with CoffeeScript', ->
    assert 4+4 == 8

describe 'external test with class Bear', ->

	it 'should return the name properly of class Bear', ->
		grizly = new Bear('Grizly')
		assert.equal grizly.name, 'Grizly'
	it 'should return Grizly the bear attacks with his bare paws!', ->
		grizly = new Bear('Grizly')
		expect(grizly.attack()).to.equal('Grizly the bear attacks with his bare paws!')

	it 'should return the attack thing', ->
		grizly = new Bear('Grizly')
		grizly.attack().should.be.equal 'Grizly the bear attacks with his bare paws!'