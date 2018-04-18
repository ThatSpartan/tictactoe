var Bear, Eleve;

Bear = class Bear {
  constructor(name) {
    this.name = name;
  }

  drunk() {
    return `${this.name} the bear is drunk!`;
  }

};

// Application
Eleve = class Eleve {
  constructor(name) {
    this.name = name;
    this.grades = [];
  }

  addGrade(grade) {
    var i, j, len, results;
    if (typeof grade === 'object') {
      results = [];
      for (j = 0, len = grade.length; j < len; j++) {
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

};

// This line needs to be last
module.exports = {Bear, Eleve};
