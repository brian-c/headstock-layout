tuner_post_d = 10;

module tuner() {
  shaft = in(0.490)-tuner_post_d/2;
  rotate(tuner_tilt) {
    translate([in(0.859-0.548)/-2, in(0.490)-shaft/2]) square(size=[in(0.859), shaft], center=true);
    difference() {
      hull() {
        translate([0, in(0.490)/2]) square(size=[in(0.548), in(0.490)], center=true);
        translate([0, in(0.337)*-1]) circle(r=in(0.088));
      }
      hole(d=tuner_post_d);
      translate([0, in(0.337)*-1]) hole(d=in(7/64));
    }
  }
}
_tuner_h = in(0.490+0.337+0.088);
_tuner_w = in(0.548);
