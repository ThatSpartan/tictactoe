# mocha --compilers coffee:coffee-script/register

{TaskList, List, Bear} = require '../src/task'

describe 'Task instance', ->
	task1 = task2 = null
	it 'should have a name', ->
		task1 = new Task 'feed the cat'
		task1.name.should.equal 'feed the cat'

describe 'Test player', ->
	it 'should have a name', ->
		task1 = new Bear 'Sylvain'
		task1.name.should.equal 'Sylvain'