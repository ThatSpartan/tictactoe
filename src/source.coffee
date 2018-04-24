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
            td.setAttribute 'id', 'box_' + j
            td.addEventListener 'click', clicked
            tr.appendChild td
    
    div_game.appendChild table

player = ''
switch_player = () ->
    if player is 'x'
        player = 'o'
    else
        player = 'x'

clicked = () ->
    if this.classList.length is 0
        switch_player()
        this.classList.add player