class Vector {
  float x, y, originX, originY;
  int quadrant;
  // We need pixelsToMeter uh oh
  
  Vector(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  Vector(float originX, float originY, float magnitude, int quadrant, float angle, boolean radians) {
    
    if (!radians) { angle = PI/180; }

    this.x = magnitude * cos(angle);
    this.y = magnitude * sin(angle);
    this.quadrant = quadrant;
    
    this.originX = originX;
    this.originY = originY;
        
    if (this.quadrant == 3 || this.quadrant == 4) { this.y *= -1; }
    if (this.quadrant == 2 || this.quadrant == 3) { this.x *= -1; }
    
    this.x += this.originX;
    this.y += this.originY;
  }
  
  float distToLine(Vector A, Vector B) {
    float slope = (B.y - A.y) / (B.x - A.x);
    
    // Equation for line: y = slope(x - A.x) + A.y;
    // Perpendicular line: y = -1 / slope * (x - this.x) + this.y;
    /* slope(x - A.x) + A.y = -1 / slope * (x - this.x) + this.y
    
    slope * x - slope * A.x + A.y = x / slope - this.x / slope + this.y
    
    slope * x + x / slope = slope * A.x - A.y - this.x / slope + this.y
    
    x(slope + 1/slope) = slope * A.x - A.y - this.x / slope + this.y
    
    x = (slope * A.x - A.y - this.x / slope + this.y) / (slope + 1 / slope)
    */
    float tempX = (slope * A.x - A.y - this.x / slope + this.y) / (slope + 1 / slope);
    float tempY = slope * (tempX - A.x) + A.y;
    Vector intercept = new Vector(tempX, tempY);
    
    return sqrt(pow(this.x - intercept.x, 2) + pow(this.y - intercept.y, 2)); 
  }
  
  void plotPoint(float pixelsToMeter) {
    stroke(0, 255, 0);
    strokeWeight(10);
    point(this.x * pixelsToMeter, this.y * pixelsToMeter);
  }
}
