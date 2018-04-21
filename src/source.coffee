eleves = null
window.onload = () ->
    eleves = new Eleves
    eleves.liste = [
        new Eleve 'Dominik', 'Dumas', [34,64,57,35,35]
        new Eleve 'Simon', 'Sabourin', [34,46,65,32]
        new Eleve 'Sylvain', 'Sabourin'
    ]
    show()

div_list = document.getElementById 'liste'

input_first_name = document.getElementById 'first_name'
input_last_name = document.getElementById 'last_name'
input_grades = document.getElementById 'grades'

btn_add_eleve = document.getElementById 'add_eleve'
btn_add_eleve.addEventListener 'click', () ->

    _name = first_name.value
    _last_name = last_name.value

    _input_grades = input_grades.value
    _grades = _input_grades.split ' '

    eleves.addEleve _name, _last_name, _grades
    show()

btn_rm_eleve = document.getElementById 'rm_eleve'
btn_rm_eleve.addEventListener 'click', () ->

    _name = first_name.value
    _last_name = last_name.value

    if _last_name isnt ''
        eleves.rmEleve _name, _last_name
    else
        eleves.removeEleve _name

    show()

show = () ->
    div_list.innerHTML = ''
    for e in eleves.liste
        el = document.createElement 'p'
        el.innerHTML = e.full_name

        if e.grades.length isnt 0

            el.innerHTML +=  " has these grades in file : "

            for g in e.grades
                el.innerHTML += "#{g}, "

            el.innerHTML = el.innerHTML.slice 0, -2

        else
            el.innerHTML += " has no grades in file"

        div_list.appendChild el
    clear()

clear = () ->
    input_first_name.value = ''
    input_last_name.value = ''
    input_grades.value = ''