class Bear
    constructor: (@name) ->
    
    drunk: () ->
        "#{@name} the bear is drunk!"

# Application

class Eleve
    constructor: (@name) ->
        @grades = []

    addGrade: (grade) ->
        if typeof grade is 'object'
            for i in grade
                @grades.push i
        else if typeof grade is 'number'
            @grades.push grade

    rmGrade: (grade) ->
        if typeof grade is 'number'
            i = @grades.indexOf(grade)
            if i isnt -1
                @grades.splice i, 1

# This line needs to be last
module.exports = {Bear, Eleve}