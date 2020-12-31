class Vector {
  float x, y, originX, originY;
  int quadrant, pixelsToMeter;
  // We need pixelsToMeter uh oh
  
  Vector(float x, float y, int pixelsToMeter) {
    this.x = x;
    this.y = y;
    this.pixelsToMeter = pixelsToMeter;
    
    if (x > 0) {
      if (y > 0) {
        this.quadrant = 1;
      } else {
        this.quadrant = 4;
      }
    } else {
      if (y > 0) {
        this.quadrant = 2;
      } else {
        this.quadrant = 3;
      }
    }
  }
  
  Vector(float originX, float originY, float magnitude, int quadrant, float angle, boolean radians, int pixelsToMeter) {
    
    this.originX = originX;
    this.originY = originY;

    this.quadrant = quadrant;
    
    if (!radians) { angle = PI/180; }
    
    this.x = magnitude * cos(angle);
    this.y = magnitude * sin(angle);
        
    if (this.quadrant == 3 || this.quadrant == 4) { this.y *= -1; }
    if (this.quadrant == 2 || this.quadrant == 3) { this.x *= -1; }
    
    this.x += this.originX;
    this.y += this.originY;
    
    this.pixelsToMeter = pixelsToMeter;
  }
  
  Vector subtract(Vector subtractor) {
    return new Vector(this.x - subtractor.x, this.y - subtractor.y, this.pixelsToMeter);
  }
  
  // Elementwise
  Vector multiplyEW(Vector multiplier) {
    return new Vector(this.x * multiplier.x, this.y * multiplier.y, this.pixelsToMeter);
  }
  
  float distToPoint(Vector point) {
    return sqrt(pow(this.x - point.x, 2) + pow(this.y - point.y, 2));
  }
  
  float distToLine(Vector A, Vector B) {
    
    float slope = (B.y - A.y) / (B.x - A.x);
    
    // float interceptX = (slope * A.x - A.y - this.x / slope + this.y) / (slope + 1 / slope);
    // float interceptY = slope * (interceptX - A.x) + A.y;
    Vector intercept = this.InterceptPoint(slope, A);
    
    return sqrt(pow(this.x - intercept.x, 2) + pow(this.y - intercept.y, 2)); 
  }
  
  Vector InterceptPoint(float slope, Vector pointOnLine) {
        
    // Find intersection Point
    // Vector A: y = slopeA(x - A1.x) + A1.y;
    // Vector B: y = slope(x - B1.x) + B1.y;
    // Solve for x, then plug for y
    // slopeA(x - A1.x) + A1.y = slopeB(x - B1.x) + B1.y
    // slopeA * x - slopeA * A1.x - slopeB * x + slopeB * B1.x = B1.y - A1.y
    //                    = (slopeA * A1.x - slopeB * B1.x + B1.y - A1.y) / (slopeA - slopeB);
    
    float xIntercept = (slope * pointOnLine.x - pointOnLine.y - this.x / slope + this.y) / (slope + 1 / slope);
    float yIntercept = slope * (xIntercept - pointOnLine.x) + pointOnLine.y;
    return new Vector(xIntercept, yIntercept, this.pixelsToMeter);
  }
  
  void plotPoint() {
    stroke(0, 255, 0);
    strokeWeight(10);
    point(this.x * this.pixelsToMeter, this.y * this.pixelsToMeter);
  }
}
