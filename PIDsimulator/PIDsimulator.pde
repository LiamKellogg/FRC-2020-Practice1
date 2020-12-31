/**

We can change the amount of energy a wheel has, and we have the rotations of the wheel

Physics:
- Create changing terrain (hard coded values are fine)
- Do simple physics tests just to make sure this is actually feasable
  - Weight
  - Normal
  - For determining the force of the wheel caused by the motor,
    we will skip that bit and set it to a constant Force because
    IDK how spin works yet.


*/
int pixelsToMeter = 100;
Vector trans = new Vector(0, 0, pixelsToMeter);

float[] terrain = {0, 0.5, 1, 1, 2, 2, 1.5, 1, 1, 1};
Terrain ground = new Terrain(terrain, pixelsToMeter);

Hitbox boxyA = new Hitbox(1, 1, 0.5, 2, PI/6, true, pixelsToMeter);
Hitbox boxyB = new Hitbox(1, -3, 0.5, 2, PI/2, true, pixelsToMeter);

void setup() {
  size(800, 600);
  noStroke();
  background(255);
  trans.x = width / (2 * pixelsToMeter);
  trans.y = height / (2 * pixelsToMeter);
}

void draw() {
  background(255);
  translate(trans.x * pixelsToMeter, trans.y * pixelsToMeter);
  
  fill(0);
  noStroke();
  // print(boxyA.IsCollide(boxyB), "\n");
  boxyA.debug();
  boxyB.debug();
  // draw terrain
}
