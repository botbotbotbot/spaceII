
rotate([0,-5,0]) {
	difference() {
		difference() {
			sphere(2,$fn=100);
			linear_extrude(height=4,center=true,convexity=10,twist=2000*$t) {
				translate([2, 0, 0]) {
					circle(r=2,$fn=50);
				}
			}
		}
		sphere(1.6, $fn=100);
	}
}

rotate([0,12,0]) {
	resize([8,6,0.6]) {
		rotate_extrude(convexity=10,$fn=100) {
			translate([4, 0, 0]) {
				circle(r=0.3,$fn=100);
			}
		}
	}
}