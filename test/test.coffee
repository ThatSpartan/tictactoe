# mocha --compilers coffee:coffee-script/register
# mocha --require coffee-script/register "test/**/*.{js,coffee}"

assert = require('chai').assert
expect = require('chai').expect
should = require('chai').should()



describe 'simple test', ->
	it 'should add 1+1', ->
		assert 1+1 == 2
	it 'should add 3+4', ->
		(4+4).should.equal(8)

describe 'next test', ->
	it 'should return true', ->
		(4).should.be.a('number')