# mocha --compilers coffee:coffee-script/register
# mocha --require coffee-script/register "test/**/*.{js,coffee}"

assert = require('chai').assert
expect = require('chai').expect
should = require('chai').should()

script = require('../src/script.coffee')

Bear = script.Bear

describe 'simple test', ->
	it 'should add 1+1', ->
		assert 1+1 == 2
	it 'should add 3+4', ->
		(4+4).should.equal(8)

describe 'next test', ->
	it 'should return true', ->
		(4).should.be.a('number')

describe 'Test the Bear external class', ->
	it 'should return the name of the bear', ->
		sylvain = new Bear 'Sylvain'
		assert.equal sylvain.name, 'Sylvain'

	it 'should also return the name of the bear', ->
		sylvain = new Bear 'Sylvain'
		sylvain.name.should.equal 'Sylvain'

	it 'should return \'Sylvain the bear is drunk!\'', ->
		sylvain = new Bear 'Sylvain'
		sylvain.drunk().should.equal 'Sylvain the bear is drunk!'
