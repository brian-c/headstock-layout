$fn = 32;

function in(v) = v*25.4;

strings = [4, 2];
string_spread = in(1+3/8);
nut_length = in(1+5/8);
tuner_spread = -22;
tuner_tilt = 5;
tuner_spacing = 5;

module hole(d=0) {
  difference() {
    circle(d=d);
    for (i=[-1:2:1]) rotate(i*45) square(size=[d/1.25, 0.5], center=true);
  }
}

include <jin-ho-standard-sealed.scad>;

_total_strings = strings[0]+strings[1];
_tuner_buffer = (_tuner_w-tuner_post_d);

for (i=[0:_total_strings-1]) {
  treble = i > strings[0]-1;

  p = treble ? _total_strings-1+strings[0]-i : i;
  string_x = p*(string_spread/(_total_strings-1))-string_spread/2;

  spread_amount = (treble ? _total_strings-1-p : p)/(strings[0]-1)/2;
  post_x = string_x-(tuner_post_d+_tuner_buffer+tuner_spread*spread_amount)/(treble ? -2 : 2);
  post_y = string_spread+_tuner_h+(i-(treble ? strings[0] : 0))*(_tuner_h+tuner_spacing);

  // Tuner
  translate([post_x, post_y]) scale([(treble ? -1 : 1), 1]) tuner(treble);

  // String
  hull() {
    translate([string_x, 0]) circle(d=0.5);
    translate([post_x-tuner_post_d/(treble ? 2 : -2), post_y]) circle(d=1);
  }
}

// Volute
translate([0, nut_length/2]) difference() {
  circle(d=nut_length);
  circle(d=nut_length-2);
  translate([0, nut_length/4]) square(size=[nut_length, nut_length/2], center=true);
}

//Nut
square(size=[nut_length, 1], center=true);

// Center line
_approximate_height = nut_length*2+(_tuner_h+tuner_spacing)*(max(strings)+0.5);
translate([0, _approximate_height/2-_tuner_h]) square(size=[0.5, _approximate_height], center=true);
