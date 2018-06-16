use <Util/tof-util.scad>

union() {
    difference() {
        cube([35, 3+3+4.02, 8]);
        translate([0, 3, 0])
            cube([35, 4.02, 8]);
    }
    translate([0, 0, 8])
        cube([35, 3+3+4.02, 2.1]);

    translate([0, 3, 8+2.1])
        cube([35, 3+4.02, 10.5]);
}