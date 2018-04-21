var Bear, Eleve, Eleves;

Bear = class Bear {
  constructor(name1) {
    this.name = name1;
  }

  drunk() {
    return `${this.name} the bear is drunk!`;
  }

};

// Application
Eleve = class Eleve {
  constructor(name1, last_name1, grades1 = []) {
    this.name = name1;
    this.last_name = last_name1;
    this.grades = grades1;
    this.full_name = `${this.name} ${this.last_name}`;
  }

  addGrade(grade) {
    var i, j, len1, results;
    if (typeof grade === 'object') {
      results = [];
      for (j = 0, len1 = grade.length; j < len1; j++) {
        i = grade[j];
        results.push(this.grades.push(i));
      }
      return results;
    } else if (typeof grade === 'number') {
      return this.grades.push(grade);
    }
  }

  rmGrade(grade) {
    var i;
    if (typeof grade === 'number') {
      i = this.grades.indexOf(grade);
      if (i !== -1) {
        return this.grades.splice(i, 1);
      }
    }
  }

  average() {
    var j, len, len1, n, ref, sum;
    sum = 0;
    ref = this.grades;
    for (j = 0, len1 = ref.length; j < len1; j++) {
      n = ref[j];
      sum += n;
    }
    len = this.grades.length;
    return sum / len;
  }

};

Eleves = class Eleves {
  constructor() {
    this.liste = [];
  }

  addEleve(name, last_name, grades = []) {
    var e, exists, j, len1, ref;
    exists = false;
    ref = this.liste;
    for (j = 0, len1 = ref.length; j < len1; j++) {
      e = ref[j];
      if (e.name === name && e.last_name === last_name) {
        exists = true;
      }
    }
    if (!exists) {
      return this.liste.push(new Eleve(name, last_name, grades));
    }
  }

  removeEleve(name, last_name = 'default') {
    var eleve, i, j, k, len1, len2, ref, ref1;
    i = [];
    if (last_name === 'default') {
      ref = this.liste;
      for (j = 0, len1 = ref.length; j < len1; j++) {
        eleve = ref[j];
        if (eleve.name === name) {
          i.push(this.liste.indexOf(eleve));
        }
      }
      if (i.length === 1) {
        return this.liste.splice(i, 1);
      }
    } else {
      ref1 = this.liste;
      for (k = 0, len2 = ref1.length; k < len2; k++) {
        eleve = ref1[k];
        if (eleve.name === name && eleve.last_name === last_name) {
          i.push(this.liste.indexOf(eleve));
        }
      }
      if (i.length === 1) {
        return this.liste.splice(i, 1);
      }
    }
  }

};

// This line needs to be last (uncomment for test only)
// module.exports = {Bear, Eleve, Eleves}

var btn_add_eleve, btn_rm_eleve, clear, div_list, eleves, input_first_name, input_grades, input_last_name, show;

eleves = null;

window.onload = function() {
  eleves = new Eleves;
  eleves.liste = [new Eleve('Dominik', 'Dumas', [34, 64, 57, 35, 35]), new Eleve('Simon', 'Sabourin', [34, 46, 65, 32]), new Eleve('Sylvain', 'Sabourin')];
  return show();
};

div_list = document.getElementById('liste');

input_first_name = document.getElementById('first_name');

input_last_name = document.getElementById('last_name');

input_grades = document.getElementById('grades');

btn_add_eleve = document.getElementById('add_eleve');

btn_add_eleve.addEventListener('click', function() {
  var _grades, _input_grades, _last_name, _name;
  _name = first_name.value;
  _last_name = last_name.value;
  _input_grades = input_grades.value;
  _grades = _input_grades.split(' ');
  eleves.addEleve(_name, _last_name, _grades);
  return show();
});

btn_rm_eleve = document.getElementById('rm_eleve');

btn_rm_eleve.addEventListener('click', function() {
  var _last_name, _name;
  _name = first_name.value;
  _last_name = last_name.value;
  if (_last_name !== '') {
    eleves.rmEleve(_name, _last_name);
  } else {
    eleves.removeEleve(_name);
  }
  return show();
});

show = function() {
  var e, el, g, i, j, len, len1, ref, ref1;
  div_list.innerHTML = '';
  ref = eleves.liste;
  for (i = 0, len = ref.length; i < len; i++) {
    e = ref[i];
    el = document.createElement('p');
    el.innerHTML = e.full_name;
    if (e.grades.length !== 0) {
      el.innerHTML += " has these grades in file : ";
      ref1 = e.grades;
      for (j = 0, len1 = ref1.length; j < len1; j++) {
        g = ref1[j];
        el.innerHTML += `${g}, `;
      }
      el.innerHTML = el.innerHTML.slice(0, -2);
    } else {
      el.innerHTML += " has no grades in file";
    }
    div_list.appendChild(el);
  }
  return clear();
};

clear = function() {
  input_first_name.value = '';
  input_last_name.value = '';
  return input_grades.value = '';
};
