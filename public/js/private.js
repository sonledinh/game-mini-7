            
var club     = [[16, 20], [20], [14, 20]];
var star     = [[12, 19], [1, 14], [3, 10]];
var spade    = [[5, 11, 18], [2, 7, 11], [1, 4, 9, 13]];
var heart    = [[4, 9, 17], [4, 6, 10, 18], [5, 8, 12]]; 
var voucher    = [[1, 3, 8, 15], [5, 9, 13, 17], [2, 7, 11, 18]]; 
var cls    = [[2, 7, 14], [15], [6, 15, 19]]; 
var piz    = [[6, 10, 13], [3, 8, 12, 16, 19], [16, 17]]; 

var cost     = 100;
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
  var winnings = 0;

  if (picked[0] === 1 && picked[1] === 2 && picked[2] === 3) {}

  if (picked[0] === 4 && picked[1] === 4 && picked[2] === 4) {}

  if (picked[0] === 3 && picked[1] === 3 && picked[2] === 3) {}

  if (picked[0] === 2 && picked[1] === 2 && picked[2] === 2) {}

  if (picked[0] === 1 && picked[1] === 1 && picked[2] === 1) {}
 
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
  setTimeout(function(){
    swal('Thông báo', message_raw, 'success');
  }, 1000);
}

function spin(pick1, pick2, pick3, ) {
  // var pick1 = rand(0, 19);
  // var pick2 = rand(0, 19);
  // var pick3 = rand(0, 19);

  var rand1 = Math.abs(pick1 * 150) * -1;
  var rand2 = Math.abs(pick2 * 150) * -1;
  var rand3 = Math.abs(pick3 * 150) * -1;

  var start1 = rand(0,   200);
  var start2 = rand(200, 400);
  var start3 = rand(400, 600);

  // var start1 = 0;
  // var start2 = 0;
  // var start3 = 0;

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
    } else if (contains(cls[0], pick1 + 1)) {
      picked.push(6);
    } else if (contains(piz[0], pick1 + 1)) {
      picked.push(7);
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
    } else if (contains(cls[1], pick2 + 1)) {
      picked.push(6);
    } else if (contains(piz[1], pick2 + 1)) {
      picked.push(7);
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
    } else if (contains(cls[2], pick3 + 1)) {
      picked.push(6);
    } else if (contains(piz[2], pick3 + 1)) { 
      picked.push(7);
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

 