class Eleve
    constructor: (@name, @last_name, @grades = []) ->
        @full_name = "#{@name} #{@last_name}"

    addGrade: (grade) ->
        if typeof grade is 'object'
            for i in grade
                @grades.push i
        else if typeof grade is 'number'
            @grades.push grade

class Eleves
    constructor: ->
        @liste = []

    addEleve: (name, last_name, grades = []) ->
        exists = false
        for e in @liste
            if e.name is name and e.last_name is last_name
                # console.log '-- already exists'
                exists = true
        @liste.push new Eleve(name, last_name, grades) if not exists

    removeEleve: (name, last_name) ->
        i = 0
        for eleve in @liste
            if (eleve.name is name) and (eleve.last_name is last_name)
                i = @liste.indexOf eleve
                # console.log i
        @liste.splice i, 1
                

eleves = new Eleves

eleves.liste = [
    new Eleve('Sylvain', 'Sabourin', [10,20,30]),
    new Eleve('Alex', 'Tittley', [40,68,38,69]),
    new Eleve('Salut', 'Cardinal', [2,55,76,45,34,42]),
    new Eleve('Marielle', 'Cléroux', [20,48])
]

# console.log "Élève : #{eleve.full_name}" for eleve in eleves.liste
# console.log "#{eleve.name} a obtenu ces notes : #{eleve.grades}" for eleve in eleves.liste

# eleves.addEleve 'Annick', 'Ménard', [100,100,100]
# eleves.addEleve 'Annick', 'Ménard', [100,100,100]

# console.log "Élève : #{eleve.full_name}" for eleve in eleves.liste
# console.log "#{eleve.name} a obtenu ces notes : #{eleve.grades}" for eleve in eleves.liste

# eleves = [
#     new Eleve('Sylvain', 'Sabourin', [10,20,30]),
#     new Eleve('Alex', 'Tittley', [40,68,38,69]),
#     new Eleve('Alex', 'Cardinal', [2,55,76,45,34,42]),
#     new Eleve('Marielle', 'Cléroux', [20,48])
# ]

# console.log "Élève : #{eleve.full_name}" for eleve in eleves

# eleves.removeEleve 'Alex', 'Tittley'
# console.log "Élève : #{eleve.full_name}" for eleve in eleves.liste

# arr = [0,1,2,3,4,5]
# console.log arr.splice(2,1)
# console.log arr