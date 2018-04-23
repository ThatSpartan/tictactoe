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
module.exports = {Game};


