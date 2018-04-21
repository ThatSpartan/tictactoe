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
Eleves = script.Eleves

describe 'Tests for Eleve', ->
	rose = null
	beforeEach ->
		rose = new Eleve 'Rose', 'Grezla'

	it 'Should return Eleve\'s name', ->
		rose.name.should.equal 'Rose'

	it 'Should return Eleve\'s full name', ->
		rose.full_name.should.equal 'Rose Grezla'

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

	it 'Should show grades', ->
		grades = [10, 20, 30, 40]
		for g in grades
			rose.addGrade g
		rose.grades.should.have.members [10, 20, 30, 40]

	it 'Should return the average grade', ->
		rose.grades = [40, 40, 60, 60]
		a = rose.average()
		a.should.equal 50

describe 'Test pour la liste des éleves', ->
	eleves = new Eleves
	eleves.liste = [
		new Eleve('Sylvain', 'Sabourin', [10,20,30]),
		new Eleve('Alex', 'Tittley', [40,68,38,69]),
		new Eleve('Salut', 'Cardinal', [2,55,76,45,34,42]),
		new Eleve('Marielle', 'Cléroux', [20,48])
	]

	it 'Should be an instance of Eleves', ->
		eleves.should.be.instanceof Eleves

	it 'Should contain the new student', ->
		eleves.addEleve 'Rose', 'Grezla', [24,46,67,53]
		names = ''
		for n in eleves.liste
			names += n.name
		names.should.equal 'SylvainAlexSalutMarielleRose'

	it 'Should not let me add a student that\'s already there', ->
		eleves.addEleve 'Rose', 'Grezla', [39]
		names = ''
		for n in eleves.liste
			names += n.name
		names.should.equal 'SylvainAlexSalutMarielleRose'

	it 'Should not contain the removed student', ->
		eleves.removeEleve 'Rose'
		names = ''
		for n in eleves.liste
			names += n.name
		names.should.equal 'SylvainAlexSalutMarielle'
		
	it 'Should add two student with same first name', ->
		eleves.addEleve 'Katherine', 'Lortie', [39,45,41,46,64,24,64]
		eleves.addEleve 'Katherine', 'Dumas', [34,64,75,34]
		names = ''
		for n in eleves.liste
			names += n.name
		names.should.equal 'SylvainAlexSalutMarielleKatherineKatherine'

	it 'Should not remove student when passing only first name', ->
		eleves.removeEleve 'Katherine'
		names = ''
		for n in eleves.liste
			names += n.name
		names.should.equal 'SylvainAlexSalutMarielleKatherineKatherine'

	it 'Should remove student when passing both names', ->
		eleves.removeEleve 'Katherine', 'Dumas'
		names = ''
		for n in eleves.liste
			names += n.name
		names.should.equal 'SylvainAlexSalutMarielleKatherine'