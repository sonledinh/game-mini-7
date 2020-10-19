/* jQuery Slot Machine by Chris Clower */

/*
  Chances:
  Singles, reel 1: club = 7/20, spade = 1/4, heart = 3/20, diamond = 3/20, star = 1/20, smiley = 1/20
  Singles, reel 2: club = 7/20, heart = 6/20, smiley = 3/20, star = 1/10, spade = 1/10
  Singles, reel 3: heart = 6/20, spade = 1/4, diamond = 1/4, smiley = 3/20, star = 1/20
  Doubles, high to low: club (14), heart (9), spade (7), smiley(4), star (3)
  Flushes, high to low: heart (15), spade (12), smiley (7), star (4)
*/
               // First reel               // Second reel            // Third reel


// var club     = [[1, 7, 10, 13, 16, 19, 20], [4, 7, 10, 13, 20], [7, 10, 16, 20]];

// var star     = [[2, 5, 11, 14, 17],                       [2, 8, 11, 14, 16, 19],                  [1, 8, 11, 14, 17]];

// var spade    = [[3, 6, 9, 12, 15, 18],         [3, 6, 18],                  [3, 6, 9, 18]];

// var heart    = [[4, 8],               [1, 5, 9, 12, 15, 17],   [2, 4, 5, 12, 13, 15, 19]];

               
var club     = [[16, 20], [6, 11, 17, 20], [2, 14, 20]];
var star     = [[3, 7, 11, 17], [2, 5, 8, 15], [6, 10, 13, 19]];
var spade    = [[4, 8, 13, 18], [1, 9, 14, 19], [4, 5, 15, 17]];
var heart    = [[2, 6, 9, 14], [4, 10, 13], [1, 8, 9, 12, 16]]; 
var voucher    = [[1, 5, 10, 12, 15, 19], [3, 7, 12, 16, 18], [3, 7, 11, 18]]; 

var cost     = 100;
// var sScore   = 500;
// var score    = 500; 
var spinning = false;

var message_spin = '';
var message_raw = '';
var MersenneTwister = function(seed) {
  if (seed == undefined) {
    seed = new Date().getTime();
  }

  this.N = 624;
  this.M = 397;
  this.MATRIX_A   = 0x9908b0df;
  this.UPPER_MASK = 0x80000000;
  this.LOWER_MASK = 0x7fffffff;

  this.mt  = new Array(this.N);
  this.mti = this.N + 1;

  this.init_genrand(seed);
}

MersenneTwister.prototype.init_genrand = function(s) {
  this.mt[0] = s >>> 0;

  for (this.mti = 1; this.mti < this.N; this.mti++) {
    var s = this.mt[this.mti - 1] ^ (this.mt[this.mti - 1] >>> 30);

    this.mt[this.mti] = (((((s & 0xffff0000) >>> 16) * 1812433253) << 16) + (s & 0x0000ffff) * 1812433253) + this.mti;
    this.mt[this.mti] >>>= 0;
  }
}

MersenneTwister.prototype.genrand_int32 = function() {
  var y;
  var mag01 = new Array(0x0, this.MATRIX_A);

  if (this.mti >= this.N) {
    var kk;

    if (this.mti == this.N + 1) this.init_genrand(5489);

    for (kk = 0; kk < this.N - this.M; kk++) {
      y = (this.mt[kk] & this.UPPER_MASK) | (this.mt[kk + 1] & this.LOWER_MASK);
      this.mt[kk] = this.mt[kk + this.M] ^ (y >>> 1) ^ mag01[y & 0x1];
    }

    for (;kk < this.N - 1; kk++) {
      y = (this.mt[kk] & this.UPPER_MASK) | (this.mt[kk + 1] & this.LOWER_MASK);
      this.mt[kk] = this.mt[kk + (this.M - this.N)] ^ (y >>> 1) ^ mag01[y & 0x1];
    }

    y = (this.mt[this.N - 1] & this.UPPER_MASK) | (this.mt[0] & this.LOWER_MASK);
    this.mt[this.N - 1] = this.mt[this.M - 1] ^ (y >>> 1) ^ mag01[y & 0x1];

    this.mti = 0;
  }

  y = this.mt[this.mti++];

  y ^= (y >>> 11);
  y ^= (y << 7)  & 0x9d2c5680;
  y ^= (y << 15) & 0xefc60000;
  y ^= (y >>> 18);

  return y >>> 0; 
}

MersenneTwister.prototype.random = function() {
  return this.genrand_int32() * (1.0 / 4294967296.0);
}

function rand(min, max) {
  var s = Math.floor(Math.random() * 100000) * new Date().getTime();
  var m = new MersenneTwister(s);

  return Math.floor(m.random() * (max - min + 1) + min);
}

function contains(stack, needle) {
  var i = stack.length;

  while (i--) {
    if (stack[i] === needle) {
      return true;
    }
  }

  return false;
}

function checkWin(picked) {
  /*
    clubs = 1 -> 777, star = 2 -> game, spade = 3 -> radio, heart = 4 -> spin

    Winnings:
    Flushes: clubs: = 777 -> 1.700.000 vnđ
    Flushes: star: = game -> 700.000 vnđ
    Flushes: spade: = radio -> 170.000 vnđ
    Flushes: heart: = spin -> 70.000 vnđ
    Flushes: clubs, star, spade: -> voucher

  */
  var winnings = 0;

  if (picked[0] === 1 && picked[1] === 2 && picked[2] === 3) { // heart flush
    // winnings += cost * 20;
    // alert("vocher");
  }

  if (picked[0] === 4 && picked[1] === 4 && picked[2] === 4) { // heart flush
    // winnings += cost * 20;
    // alert("70.000");
  }

  if (picked[0] === 3 && picked[1] === 3 && picked[2] === 3) { // spade flush
    // winnings += cost * 20;
    // alert("170.000");
  }

  if (picked[0] === 2 && picked[1] === 2 && picked[2] === 2) { // star flush
    // winnings += cost * 20;
    // alert("700.000");
  }

  if (picked[0] === 1 && picked[1] === 1 && picked[2] === 1) { // club flush
    // winnings += cost * 20;
    // alert("1.700.000");
  }
 
  score += winnings;
  $('#winnings-1').text((winnings / 100));
  $('#winnings-2').text(((score /  100) - (sScore / 100)));

  if (winnings > 0) {
    $('#bank').text((score / 100));
    $('#payouts').text(parseInt($('#payouts').text()) + (winnings / 100));

    $('#score-float').text('+§' + (winnings / 100)).fadeIn().animate({ bottom: '70%' }, 1000, function() {
      $(this).fadeOut(500, function() {
        $(this).css({ bottom: '10%' });
      });
    });
  }
  $('.list-prize ul').prepend(message_spin);
  swal('Thông báo', message_raw, 'success');
}

function spin(pick1, pick2, pick3, ) {
  // var pick1 = rand(0, 19);
  // var pick2 = rand(0, 19);
  // var pick3 = rand(0, 19);

  var rand1 = Math.abs(pick1 * 150) * -1;
  var rand2 = Math.abs(pick2 * 150) * -1;
  var rand3 = Math.abs(pick3 * 150) * -1;

  var start1 = rand(0,   200);
  var start2 = rand(200, 700);
  var start3 = rand(600, 1000);

  var picked = [];

  if (!spinning && score >= 100) {
    spinning = true;
    score   -= cost;
    $('#bank').text((score / 100));

    setTimeout(function() {
      var $main  = $('#reel-col-1 .reel-container');
      var $clone = $main.clone().prependTo('#reel-col-1').css({ top: $main.position().top - 3000 });

      $main.animate({ top: '+=2850' }, 1000, 'linear', function() {
        $('#reel-col-1 .reel-container:nth-child(2)').remove();
      });

      $clone.animate({ top: '+=2850' }, 1000, 'linear', function() {
        $clone.animate({ top: rand1 }, 0, 'linear');
      });
    }, start1);

    setTimeout(function() {
      var $main  = $('#reel-col-2 .reel-container');
      var $clone = $main.clone().prependTo('#reel-col-2').css({ top: $main.position().top - 3000 });

      $main.animate({ top: '+=2850' }, 1000, 'linear', function() {
        $('#reel-col-2 .reel-container:nth-child(2)').remove();
      });

      $clone.animate({ top: '+=2850' }, 1000, 'linear', function() {
        $clone.animate({ top: rand2 }, 0, 'linear');
      });
    }, start2);

    setTimeout(function() {
      var $main  = $('#reel-col-3 .reel-container');
      var $clone = $main.clone().prependTo('#reel-col-3').css({ top: $main.position().top - 3000 });

      $main.animate({ top: '+=2850' }, 1000, 'linear', function() {
        $('#reel-col-3 .reel-container:nth-child(2)').remove();
      });

      $clone.animate({ top: '+=2850' }, 1000, 'linear', function() {
        $clone.animate({ top: rand3 }, 0, 'linear');
        spinning = false;
        checkWin(picked);
      });
    }, start3);

    if (contains(club[0], pick1 + 1)) {
      picked.push(1);
    } else if (contains(star[0], pick1 + 1)) {
      picked.push(2);
    } else if (contains(spade[0], pick1 + 1)) {
      picked.push(3);
    } else if (contains(heart[0], pick1 + 1)) {
      picked.push(4);
    } else if (contains(voucher[0], pick1 + 1)) {
      picked.push(5);
    }

    if (contains(club[1], pick2 + 1)) {
      picked.push(1);
    } else if (contains(star[1], pick2 + 1)) {
      picked.push(2);
    } else if (contains(spade[1], pick2 + 1)) {
      picked.push(3);
    } else if (contains(heart[1], pick2 + 1)) {
      picked.push(4);
    } else if (contains(voucher[1], pick2 + 1)) {
      picked.push(5);
    }

    if (contains(club[2], pick3 + 1)) {
      picked.push(1);
    } else if (contains(star[2], pick3 + 1)) {
      picked.push(2);
    } else if (contains(spade[2], pick3 + 1)) {
      picked.push(3);
    } else if (contains(heart[2], pick3 + 1)) {
      picked.push(4);
    } else if (contains(voucher[2], pick3 + 1)) {
      picked.push(5);
    }
  }
}



//$('#score-float').fadeIn();

$('#spin').on('click', function(e) {
  e.preventDefault();
  $.ajax({
      url: '/api/spin',
      method: 'post', 
      data: {
          staff_id : staff_id
      },
      success: (res) => {
          if(res.status) {
              spin(res.pick1, res.pick2, res.pick3);
              // swal('Thông báo', res.mess_f, 'success');
              message_raw = res.mess_f;
              message_spin = res.message;
          }
          else {
              if(res.mess_f) {
                spin(res.pick1, res.pick2, res.pick3);
                 message_raw = res.mess_f;
              } else {
                 swal('Thông báo', res.message || 'Bạn đã hết lượt chơi hôm nay!', 'error');
              }

             
          }
      },
      error: (e) => {

      }
  });
});

$('#bank').text((sScore / 100));

 