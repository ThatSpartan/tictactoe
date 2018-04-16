# mocha --compilers coffee:coffee-script/register

describe 'Task instance', ->
	it 'should add two numbers', ->
		(2+2).should.equal 4
