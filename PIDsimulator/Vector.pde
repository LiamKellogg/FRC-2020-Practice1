class Vector {
  float x, y;
  
  Vector(float x, float y) {
    this.x = x;
    this.x = y;
  }
  
  Vector(float magnitude, float angle, boolean radians) {
    
    if (!radians) { angle = PI/180; }
    
    x = magnitude * cos(angle);
    y = magnitude * sin(angle);
  }
  
  float distToPt(Vector PointOffLine) {
    
    Vector PointOnLine = new Vector(x, y);
    Vector intersection = new Vector(0, 0);
    float slope = y / x;
    
    intersection.x = PointOffLine.x / slope + PointOffLine.y + slope * PointOnLine.x + PointOnLine.y;
    intersection.y = slope * intersection.x + slope * PointOnLine.x + PointOnLine.y;
    
    return sqrt(pow(intersection.x - PointOffLine.x, 2) + pow(intersection.y - PointOffLine.y, 2));
    
  };
}
