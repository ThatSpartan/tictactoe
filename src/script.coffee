class Bear
    constructor: (@name) ->

    attack: ->
        "#{@name} the bear attacks with his bare paws!"

sylvain = new Bear 'Sylvain'

console.log sylvain.attack()