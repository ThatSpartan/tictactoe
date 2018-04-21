class Bear
    constructor: (@name) ->
    
    drunk: () ->
        "#{@name} the bear is drunk!"

# Application

class Eleve
    constructor: (@name, @last_name, @grades = []) ->
        @full_name = "#{@name} #{@last_name}"

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

    average: ->
        sum = 0
        for n in @grades
            sum += n
        len = @grades.length
        sum / len

class Eleves
    constructor: ->
        @liste = []

    addEleve: (name, last_name, grades = []) ->
        exists = false
        for e in @liste
            if e.name is name and e.last_name is last_name
                exists = true
        @liste.push new Eleve(name, last_name, grades) if not exists

    removeEleve: (name, last_name = 'default') ->
        i = []
        if last_name is 'default'
            for eleve in @liste
                if eleve.name is name
                    i.push @liste.indexOf eleve
            @liste.splice i, 1 if i.length is 1
        else
            for eleve in @liste
                if eleve.name is name and eleve.last_name is last_name
                    i.push @liste.indexOf eleve
            @liste.splice i, 1 if i.length is 1

# This line needs to be last (uncomment for test only)
# module.exports = {Bear, Eleve, Eleves}