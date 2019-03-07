tolerance = 1;
size = [
  198.5,
  120,
  10.45];
margin = 4;
2m = 2 * margin;

difference() {
  cube(
    size=[
      size[0] + 2m,
      size[1] + 2m,
      size[2] + 2m,
    ],
    center=true);

  cube(
    size=[
      size[0] + tolerance,
      size[1] + tolerance,
      size[2] + tolerance,
    ],
    center=true);

  translate([0, size[1]/2,0])
  cube(
    size=[
      size[0] + tolerance,
      size[1] + tolerance,
      size[2] + tolerance,
    ],
    center=true);

  translate([0, size[1]-10,size[2]/2])
  cube(
    size=[
      size[0] + tolerance,
      size[1] + tolerance,
      size[2] + tolerance,
    ],
    center=true);

  translate([0,0, size[2]/2])
  cube(
    size=[
      size[0] - 7,
      size[1] - 7,
      size[2],
    ],
    center=true);

  translate([0,0, -size[2]/2])
  cube(
    size=[
      size[0] - 20,
      size[1] - 20,
      size[2],
    ],
    center=true);

  translate([size[0]/2, 0, 0])
  cube(
    size=[
      size[0] + tolerance,
      20,
      size[2] + tolerance,
    ],
    center=true);
}