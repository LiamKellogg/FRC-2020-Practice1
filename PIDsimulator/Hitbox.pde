class Hitbox {
  
  float x, y, radius, boxthickness, boxwidth, theta, pixelsToMeter;
  boolean isBox;
  
  float cornerDist, cornerAngle;
  Vector[] BoxCorners;
  
  Hitbox(float x, float y, float radius, int pixelsToMeter) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.pixelsToMeter = pixelsToMeter;
    
    boxwidth = 0;
    boxthickness = 0;
  }
  
  Hitbox(float x, float y, float thickness, float boxwidth, float theta, boolean radians, int pixelsToMeter) {
    this.x = x;
    this.y = y;
    this.boxthickness = thickness;
    this.boxwidth = boxwidth;
    this.pixelsToMeter = pixelsToMeter;
    this.theta = theta;
    isBox = true;
    
    cornerDist = sqrt(pow(this.boxwidth/2, 2) + pow(this.boxthickness/2, 2));
    cornerAngle = atan(this.boxthickness / this.boxwidth);
    
    if (!radians) { this.theta *= PI/180; }
    
    BoxCorners = new Vector[] {
      new Vector(x, y, cornerDist, 1, this.theta + cornerAngle, true),
      new Vector(x, y, cornerDist, 2, cornerAngle - this.theta, true),
      new Vector(x, y, cornerDist, 3, cornerAngle + this.theta, true),
      new Vector(x, y, cornerDist, 4, cornerAngle - this.theta, true)
      
      /*new Vector(x + cos(this.theta + cornerAngle) * cornerDist, y + sin(cornerAngle + this.theta) * cornerDist),
      new Vector(x - cos(cornerAngle - this.theta) * cornerDist, y + sin(cornerAngle - this.theta) * cornerDist),
      new Vector(x - cos(cornerAngle + this.theta) * cornerDist, y - sin(cornerAngle + this.theta) * cornerDist),
      new Vector(x + cos(cornerAngle - this.theta) * cornerDist, y - sin(cornerAngle - this.theta) * cornerDist)*/
    };
  }
  
  boolean IsCollide(Hitbox otherCollider) {
    
    /*
    Get the angle of the point
    Get the distance of the point to the center of mass
    Corners:
    2 1
    3 4
    */
    
    
    if (this.isBox && otherCollider.isBox) {
      int i = 0;
      //while (i < BoxCorners.length && i < otherCollider.BoxCorners.length) {
     //   i ++;
     // }
      // Test if each corner of this box falls within the other box
      // Test if each corner of the other box falls within this box
    } else if (this.isBox && !otherCollider.isBox) {
      // IDK this one either
    } else if (!this.isBox && otherCollider.isBox) {
      // AAAAAAAAA
    } else {
      // Both are circles
    }
    debug();
    // Run different for circle or box
    return false;
  }
  
  boolean touchingPoint() {
    return true;
  }
  
  void debug() {
    stroke(255, 0, 0);
    strokeWeight(7);
    point(x * pixelsToMeter, y * pixelsToMeter);
    
    if (!isBox) {
    } else {
      
      for (int i = 0; i < BoxCorners.length; i ++) {
        BoxCorners[i].plotPoint(pixelsToMeter);
        // print(i, BoxCorners[i].x, BoxCorners[i].y, "\n");
      }
    }
  }
}
