var Game;

Game = class Game {
  constructor() {
    this.current_player = 0;
    this.board = new Array(9);
  }

  new() {
    return this.board = new Array(9);
  }

  switch_player() {
    if (this.current_player === 0) {
      return this.current_player = 1;
    } else {
      return this.current_player = 0;
    }
  }

  play(m) {
    if (this.board[m] === void 0) {
      this.board[m] = this.current_player;
      return this.switch_player();
    } else {
      return 'spot taken';
    }
  }

};

// This line needs to be last (uncomment for test only)
// module.exports = {Game}

var _game_over, ai, clicked, draw, game_over, get_empty_cells, id, player, switch_player;

window.onload = function() {
  var div_game, i, j, l, m, table, table_body, td, tr;
  div_game = document.getElementById('div_game');
  table = document.createElement('table');
  table.setAttribute('id', 'game');
  table_body = document.createElement('tbody');
  table.appendChild(table_body);
  for (i = l = 0; l < 3; i = ++l) {
    tr = document.createElement('tr');
    table.appendChild(tr);
    for (j = m = 0; m < 3; j = ++m) {
      td = document.createElement('td');
      td.setAttribute('id', 'box_' + (j + i * 3));
      td.addEventListener('click', clicked);
      tr.appendChild(td);
    }
  }
  return div_game.appendChild(table);
};

// player = '' # for 2 player
player = 'x'; // for 1 player

_game_over = false;

switch_player = function() {
  if (player === 'x') {
    return player = 'o';
  } else {
    return player = 'x';
  }
};

id = function(n) {
  if (document.getElementById('box_' + n).classList.contains('x')) {
    return 'x';
  } else if (document.getElementById('box_' + n).classList.contains('o')) {
    return 'o';
  } else {
    return 'e';
  }
};

draw = function() {
  var _empty;
  _empty = get_empty_cells();
  if (_empty.length === 0) {
    console.log('its a draw!!');
    return true;
  } else {
    console.log('no draw');
    return false;
  }
};

game_over = function() {
  var i, k, l, m;
  // check for draw
  if (draw()) {
    return true;
  }
// check the columns for wins
  for (i = l = 0; l <= 2; i = ++l) {
    // console.log i
    if (id(i) === id(i + 3) && id(i) === id(i + 6) && id(i) !== 'e') {
      return true;
    }
  }
// alert 'winner in a column'
// console.log 'winner in a column'
// check the rows for wins
  for (i = m = 0; m <= 2; i = ++m) {
    k = i * 3;
    // console.log k
    if (id(k) === id(k + 1) && id(k) === id(k + 2) && id(k) !== 'e') {
      return true;
    }
  }
  // alert 'winner in a row'
  // console.log 'winner in a row'
  // check diagonals for wins
  if (id(0) === id(4) && id(0) === id(8) && id(0) !== 'e') {
    return true;
  }
  // alert 'winner in a diagonal 1'
  // console.log 'winner in a diagonal 1'
  if (id(2) === id(4) && id(4) === id(6) && id(2) !== 'e') {
    return true;
  }
};

// alert 'winner in a diagonal 2'
// console.log 'winner in a diagonal 2'
get_empty_cells = function() {
  var _empty, i, l;
  _empty = [];
  for (i = l = 0; l <= 8; i = ++l) {
    if (id(i) === 'e') {
      _empty.push(i);
    }
  }
  return _empty;
};

ai = function() {
  var _empty, ran;
  _empty = get_empty_cells();
  ran = Math.floor(Math.random() * Math.floor(_empty.length));
  console.log(_empty);
  // console.log _empty.length
  // console.log ran
  document.getElementById('box_' + _empty[ran]).classList.add('o');
  return document.getElementById('box_' + _empty[ran]).removeEventListener('click', clicked);
};

// el.classList.add 'o'
// el.removeEventListener 'click', clicked
clicked = function() {
  var el;
  if (this.classList.length === 0) {
    // switch_player() # for two players
    this.classList.add(player);
    this.removeEventListener('click', clicked);
    if (game_over()) {
      alert('you won');
      el = document.getElementById('game');
      el.parentNode.removeChild(el);
      window.onload();
      return true;
    }
    ai();
  }
  // console.log this.id
  if (game_over()) {
    alert('you lost');
    el = document.getElementById('game');
    el.parentNode.removeChild(el);
    window.onload();
    return true;
  }
};
