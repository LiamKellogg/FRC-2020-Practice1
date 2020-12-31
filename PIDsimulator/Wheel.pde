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
    
    /* Debate internally how to handle the motion of the ball and where the forces of the ball come from (should they be a new class?)
        - The ball should have a Vector for the velocity of the ball
        - Acceleration is change in velocity over time, it is the slope of velocity
        - We need to define a second
        - There are two forces, Weight and Normal
        - As we learn more, we will discover traction, spin, and rotation
        - The force class would have the type of force, and different parameters if its a smart force, direction of force, etc.
        - Force will return a float in Newtons
        - If not a force class, we would have all these values scattered and disorganized
        - It would be easier for a while, and with two forces on the ball should be fine
      
      Conclusion: Yea have a force class
    */
    
  }
}
