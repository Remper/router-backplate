m = 10; // centimeters

big_width = 27.5 * m;
big_height = 22 * m;

small_width = 25.5 * m;
small_height = 19.8 * m;

screws_width_d = 23 * m;

depth = 2 * m;
thickness = 0.2 * m;
screw_hole = 0.1 * m;

mounting_plate_hole_width = small_width/2-(small_width-screws_width_d);

main_plate_hole_width = small_width/6;
main_plate_hole_shift = small_width/2-main_plate_hole_width/2;

union() {

// main backplate
difference() {
    cube([big_width, big_height, thickness], center = true);
    translate([main_plate_hole_shift,0,0]) {
        cube([main_plate_hole_width, small_height-thickness*2, thickness*2], center = true);
    }
    translate([-main_plate_hole_shift-m,0,0]) {
        cube([main_plate_hole_width-2*m, small_height-thickness*2-14*m, thickness*2], center = true);
    }
}
    
// protrusion walls
translate([-small_width/2, -small_height/2, -depth]) {
    cube([small_width, thickness,  depth]);
}
translate([-small_width/2, small_height/2-thickness, -depth]) {
    cube([small_width, thickness,  depth]);
}

// mounting plate
translate([0,0,-depth]) {
    difference() {
        cube([small_width, small_height, thickness], center = true);
        translate([-screws_width_d/2,0,0]) {
            cylinder(h = thickness, d = screw_hole, $fn = 100, center = true);
        }
        translate([screws_width_d/2,0,0]) {
            cylinder(h = thickness*4, d = screw_hole, $fn = 100, center = true);
        }
        translate([-screws_width_d/6+0.1,0,0]) {
            cube([screws_width_d/3, small_height-thickness*2, thickness*2], center = true);
        }
        translate([mounting_plate_hole_width/2,0,0]) {
            cube([mounting_plate_hole_width, small_height-thickness*2, thickness*2], center = true);
        }
    }
}

} // union