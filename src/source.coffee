window.onload = () ->
    div_game = document.getElementById 'div_game'

    table = document.createElement 'table'
    table.setAttribute 'id', 'game'

    table_body = document.createElement 'tbody'
    table.appendChild table_body

    for i in [0...3]
        tr = document.createElement 'tr'
        table.appendChild tr

        for j in [0...3]
            td = document.createElement 'td'
            td.setAttribute 'id', 'box_' + (j + i * 3)
            td.addEventListener 'click', clicked
            tr.appendChild td
    
    div_game.appendChild table

# player = '' # for 2 player
player = 'x' # for 1 player
_game_over = false
switch_player = () ->
    if player is 'x'
        player = 'o'
    else
        player = 'x'

id = (n) ->
    if document.getElementById('box_' + n).classList.contains('x')
        return 'x'
    else if document.getElementById('box_' + n).classList.contains('o')
        return 'o'
    else return 'e'

draw = () ->
    _empty = get_empty_cells()
    if _empty.length is 0
        console.log 'its a draw!!'
        return true
    else
        console.log 'no draw'
        return false

game_over = () ->
    # check for draw
    if draw()
        return true
    # check the columns for wins
    for i in [0..2]
        # console.log i
        if id(i) is id(i+3) and id(i) is id(i+6) and id(i) isnt 'e'
            return true
            # alert 'winner in a column'
            # console.log 'winner in a column'
    # check the rows for wins
    for i in [0..2]
        k = i * 3
        # console.log k
        if id(k) is id(k+1) and id(k) is id(k+2) and id(k) isnt 'e'
            return true
            # alert 'winner in a row'
            # console.log 'winner in a row'
    # check diagonals for wins
    if id(0) is id(4) and id(0) is id(8) and id(0) isnt 'e'
        return true
        # alert 'winner in a diagonal 1'
        # console.log 'winner in a diagonal 1'
    if id(2) is id(4) and id(4) is id(6) and id(2) isnt 'e'
        return true
        # alert 'winner in a diagonal 2'
        # console.log 'winner in a diagonal 2'

get_empty_cells = () ->
    _empty = []
    for i in [0..8]
        if id(i) is 'e'
            _empty.push(i)
    return _empty

ai = () ->
    _empty = get_empty_cells()
    ran = Math.floor(Math.random() * Math.floor(_empty.length))
    console.log _empty
    # console.log _empty.length
    # console.log ran
    document.getElementById('box_' + _empty[ran]).classList.add 'o'
    document.getElementById('box_' + _empty[ran]).removeEventListener 'click', clicked
    # el.classList.add 'o'
    # el.removeEventListener 'click', clicked


clicked = () ->
    if this.classList.length is 0
        # switch_player() # for two players
        this.classList.add player
        this.removeEventListener 'click', clicked
        if game_over()
            alert 'you won'
            el = document.getElementById 'game'
            el.parentNode.removeChild el
            window.onload()
            return true
        ai()
    # console.log this.id
    if game_over()
        alert 'you lost'
        el = document.getElementById 'game'
        el.parentNode.removeChild el
        window.onload()
        return true