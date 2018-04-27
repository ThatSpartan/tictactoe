// This line needs to be last (uncomment for test only)
// module.exports = {}


var clicked, player, switch_player;

window.onload = function() {
  var div_game, i, j, k, l, table, table_body, td, tr;
  div_game = document.getElementById('div_game');
  table = document.createElement('table');
  table.setAttribute('id', 'game');
  table_body = document.createElement('tbody');
  table.appendChild(table_body);
  for (i = k = 0; k < 3; i = ++k) {
    tr = document.createElement('tr');
    table.appendChild(tr);
    for (j = l = 0; l < 3; j = ++l) {
      td = document.createElement('td');
      td.setAttribute('id', 'box_' + j);
      td.addEventListener('click', clicked);
      tr.appendChild(td);
    }
  }
  return div_game.appendChild(table);
};

player = '';

switch_player = function() {
  if (player === 'x') {
    return player = 'o';
  } else {
    return player = 'x';
  }
};

clicked = function() {
  if (this.classList.length === 0) {
    switch_player();
    return this.classList.add(player);
  }
};
