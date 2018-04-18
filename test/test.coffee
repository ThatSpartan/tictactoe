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

# Tests

Eleve = script.Eleve

describe 'Tests for Eleve', ->
	rose = null
	beforeEach ->
		rose = new Eleve 'Rose'

	it 'Should return Eleve\'s name', ->
		rose.name.should.equal 'Rose'

	it 'Should add one grade', ->
		rose.addGrade 69
		rose.grades.should.have.members [69]

	it 'Should add two grades', ->
		rose.addGrade [40, 50]
		rose.grades.should.have.members [40, 50]

	it 'Should remove one grade', ->
		rose.grades = [69, 40]
		rose.rmGrade 69
		rose.grades.should.have.members [40]

	it 'Should remove a grade not in the list', ->
		rose.grades = [60, 40]
		rose.rmGrade 100
		rose.grades.should.have.members [60, 40]
