tolerance = 1;
cable_radius = 2 + tolerance/2;
size = [198.5, 120, 10.45];
margin = 4;

module frame(frame_size, border) {
  difference() {
    cube(size=frame_size, center=true);

    cube(size=[
      frame_size[0] - border,
      frame_size[1] - border,
      frame_size[2] + margin],
      center=true);
  }
}

module backplate() {
  backplate_border = 2 * (margin + size[2]);

  difference() {
    frame([
      size[0] - 2,
      size[1] - 10,
      margin
    ], border=backplate_border);

    for(i=[-1,1]) {
      translate([
        i*(size[0] - 2 - backplate_border + 10)/2,
        size[1]/2 - backplate_border + margin,
        0])
      rotate([0, 90, 0])
      cylinder(r=cable_radius, h=30, center=true);
    }
  }
}

module sides() {
  side_height = size[2] + margin;

  difference() {
    frame([
      size[0] - 2,
      size[1] - 10,
      side_height
    ], border=2 * margin);

    // top opening
    translate([0, (size[1] - 10 - margin) / 2, 0])
    cube([
      size[0],
      margin,
      side_height
    ], center=true);

    // plug hole
    translate([(size[0] - 2 - margin) / 2, 0, -margin/2])
    cube([
      2 * margin,
      20,
      size[2]
    ], center=true);
  }
}

module top() {
  difference() {
    frame([
      size[0] - 2,
      size[1] - 10,
      margin
    ], border=4*margin);

    translate([0, (size[1] - 10 - 2*margin)/2, 0])
    cube([size[0], 2*margin, 2*margin], center=true);
  }
}

module holder() {
  union() {
    translate([0,0,(size[2] + margin)/2])
    top();

    translate([0,0,margin/2])
    sides();

    translate([0,0,-(size[2] + 2 * margin)/2 + 2])
    backplate();
  }
}

holder();