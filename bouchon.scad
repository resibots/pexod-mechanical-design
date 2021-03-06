include <settings.scad>
use <modules.scad>
use <utils.scad>

cap(3);

//////////
// Modules
//////////

module cap(base_thickness = 2) {
  bearing_caps(base_thickness) {
    difference() {
        cap_base(base_thickness);
        mounting_holes();
    }
  }
}

module cap_base(thickness = 2) {
  difference() {
    hull() {
      translate([15, 0, 0]) cylinder(h=thickness, r=11.25);
      mirror([1, 0, 0]) translate([15, 0, 0]) cylinder(h=thickness, r=11.25);
    }
    translate([-16, -(11-wall_thickness), -1])
      cube([32, 22-2*wall_thickness, thickness+2]);
  }
  translate([15, 0, 0]) cylinder(h=thickness, r=11.25);
  mirror([1, 0, 0]) translate([15, 0, 0]) cylinder(h=thickness, r=11.25);
}

module bearing_caps(base_thickness = 2) {
  // caps over the pipe holders
  difference () {
    union() {
      translate([15, 0, 1]) cylinder(h=4+base_thickness, r=9.5);
      mirror([1, 0, 0]) translate([15, 0, 1]) cylinder(h=4+base_thickness, r=9.5);
      children();
    }

    // Holes in the cap to let the pipes go through.
    translate([15, 0, -1])
      cylinder(h=7+base_thickness, r=7);
    mirror([1, 0, 0])
      translate([15, 0, -1])
        cylinder(h=7+base_thickness, r=7);
  }
}

// These are the cylinders to dig holes to attach this piece to support_guidages.
module mounting_holes(){
  translate([0, 11.25-wall_thickness/2, -1])
    cylinder(h=9, d=2.7);
  mirror([0, 1, 0])
    translate([0, 11.25-wall_thickness/2, -1])
      cylinder(h=9, d=2.7);
}