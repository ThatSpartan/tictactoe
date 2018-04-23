assert = require('chai').assert
expect = require('chai').expect
should = require('chai').should()

script = require('../src/script.coffee')

Game = script.Game

describe 'this should test creation of the tictactoe game', ->
    it 'should test the game variables', ->
        game = new Game

        should.exist game.board
        game.board.should.be.a 'array'
        game.board.should.deep.equal new Array 9

        game.new()
        game.board.should.deep.equal new Array 9

    it 'should test game.current_player switch', ->
        game = new Game

        should.exist game.current_player
        game.current_player.should.equal 0

        game.new()

        should.exist game.switch_player
        game.switch_player()
        game.current_player.should.equal 1

    it 'should test player moves', ->
        game = new Game

        should.exist game.play
        game.play '2'
        game.board.should.have.ordered.deep.members [0]

    it 'should test game end'