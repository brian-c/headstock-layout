tuner_post_d = 10;

module tuner() {
  rotate(tuner_tilt) {
    difference() {
      union() {
        translate([(16-24)/2, 8]) square(size=[24, 8], center=true);
        translate([0, 12/2]) square(size=[16, 12], center=true);
        circle(d=16);
        hull() {
          circle(d=10);
          translate([8*(false ? -1 : 1), -8]) circle(r=3);
        }
      }
      hole(d=tuner_post_d);
      translate([8*(false ? -1 : 1), -8]) hole(d=2);
    }
  }
}

_tuner_h = 23;
_tuner_w = 19;
