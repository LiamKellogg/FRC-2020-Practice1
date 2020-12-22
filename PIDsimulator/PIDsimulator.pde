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
int[] trans = {0, 0};
float[] terrain = {0, 0.5, 1, 1, 2, 2, 1.5, 1, 1, 1};
int terrainPointCount = terrain.length;

void drawTerrain(int numPoints, float[] points) {
  strokeWeight(5);
  stroke(75);
  for(int i = 0; i < numPoints - 1; i ++) {
    line(i * pixelsToMeter, points[i] * pixelsToMeter, (i + 1) * pixelsToMeter, points[i + 1] * pixelsToMeter);
  }
}


void setup() {
  size(800, 600);
  noStroke();
  background(255);
  trans[0] = 50;
  trans[1] = height * 2 / 3;
}

void draw() {
  background(255);
  translate(trans[0], trans[1]);
  
  fill(0);
  noStroke();
  drawTerrain(terrainPointCount, terrain);
}
