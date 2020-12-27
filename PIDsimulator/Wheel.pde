class PoweredWheel {
  
  float mass, radius, power, xPos, yPos;
  PoweredWheel (float m, float r, float p, float Xi, float Yi) {
    mass = m;
    radius = r;
    power = p;
    xPos = Xi;
    yPos = Yi;
  }
  
  void drawWheel() {
    noStroke();
    fill(10);
    circle(xPos, yPos, radius);
    fill(130);
    circle(xPos, yPos, 20);
  }
  
  void calculateMotion(float[] ground) {
    
     float slopeOfGround = ground[ceil(xPos)] / ground[floor(xPos)];
    float theta = tan(slopeOfGround);
    float Fgravity = 9.8 * mass;
    float NormalWE = 0;
    
    // Find if their is a collision
    
    // Normal force is 0 if the object is in freefall, and the cos(theta) if the object is on the ground
    
  }
}
