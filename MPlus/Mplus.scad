use <Util/tof-util.scad>

height = 50;

module heart_sub_component(radius) {
    rotated_angle = 45;
    diameter = radius * 2;
    $fn = 48;

    translate([-radius * cos(rotated_angle), 0, 0]) 
        rotate(-rotated_angle) union() {
            circle(radius);
            translate([0, -radius, 0]) 
                square(diameter);
        }
}

module heart(radius, center = false) {
    offsetX = center ? 0 : radius + radius * cos(45);
    offsetY = center ? 1.5 * radius * sin(45) - 0.5 * radius : 3 * radius * sin(45);

    translate([offsetX, offsetY, 0]) union() {
        heart_sub_component(radius);
        mirror([1, 0, 0]) heart_sub_component(radius);
    }

}

//difference() {
union() {
    translate([27.4,52.7,0]) rondelle(10, 15, 3);
    linear_extrude(height = 5) {
        difference() {
            heart(height / (3 * sin(45) + 1));
            offset(delta = -5.2) heart(height / (3 * sin(45) + 1));
        }
    }
//}

linear_extrude(height = 5) translate([8, 22, 0]) text("M +", font = "Gill Sans:style=Bold Italic", size = 18);
}

translate([60,0,0]) difference() {
union() {
    translate([27.4,52.7,0]) rondelle(10, 15, 3);
    linear_extrude(height = 5) {
        difference() {
            heart(height / (3 * sin(45) + 1));
        }
    }
}

linear_extrude(height = 7) translate([8, 24, 0]) text("M +", font = "Gill Sans:style=Bold Italic", size = 18);
}