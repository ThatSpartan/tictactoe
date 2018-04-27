class Game
    constructor: ->
        @current_player = 0
        @board = new Array 9

    new: ->
        @board = new Array 9

    switch_player: ->
        if @current_player is 0
            @current_player = 1
        else
            @current_player = 0

    play: (m) ->
        if @board[m] is undefined
            @board[m] = @current_player
            this.switch_player()
        else
            return 'spot taken'


# This line needs to be last (uncomment for test only)
# module.exports = {Game}