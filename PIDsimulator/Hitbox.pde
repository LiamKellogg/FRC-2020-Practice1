class Hitbox {
  
  float x, y, radius, boxthickness, boxwidth, theta;
  int pixelsToMeter;
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
    
    this.BoxCorners = new Vector[] {
      new Vector(x, y, cornerDist, 1, this.theta + cornerAngle, true, this.pixelsToMeter),
      new Vector(x, y, cornerDist, 2, cornerAngle - this.theta, true, this.pixelsToMeter),
      new Vector(x, y, cornerDist, 3, cornerAngle + this.theta, true, this.pixelsToMeter),
      new Vector(x, y, cornerDist, 4, cornerAngle - this.theta, true, this.pixelsToMeter)
    };
    
    // print(this.distLineSegment(new Vector(1, 0, 0), new Vector(-2,-1, 0), new Vector(-1, 1, 0), new Vector(1, 1, 0)), "\n");
  }
  
  boolean IsCollide(Hitbox collider) {
    
    /*
    Get the angle of the point
    Get the distance of the point to the center of mass
    Corners:
    2 <width> 1
      <height>
    3 <width> 4
    */
    
    
    if (this.isBox && collider.isBox) {
      
      // Currently this is abysmally ineffecient
      // IDK if this will work
      int i = 0;
      while (i < this.BoxCorners.length) {
        int j = 0;
        while (j < collider.BoxCorners.length) {
          if (this.distLineSegment(this.BoxCorners[i], this.BoxCorners[(i + 1) % 4], collider.BoxCorners[i], collider.BoxCorners[(i + 1) % 4]) <= 0) {
            return true;
          }
          j += 1;
        }
        i += 1;
      }
    } else if (this.isBox && !collider.isBox) {
      // For each segment if the distance is less than the radius, return true
    } else if (!this.isBox && collider.isBox) {
      // AAAAAAAAA
    } else {
      // Both are circles
    }
    debug();
    // Run different for circle or box
    return false;
  }
  
  float distLineSegment(Vector A1, Vector A2, Vector B1, Vector B2) {
    
    // NOTE: TO CALCULATE IF THE LINE PASSES THROUGH THE OTHER LINE,
    // WE WOULD NEED TO HAVE THE CHANGE IN POSITION OF THE LINE SEGMENTS
    // AND CHECK IF THAT INTERSECTS WITH EACH OTHER OR A LINE SEGMENT
    
    // If lines intersect
    // Return the distance from intersection to the closest point
    // Else find distances of A1 B1, A2 B1, B2 A1, B2 A2
    float slopeA = (A2.y - A1.y) / (A2.x - A1.x);
    float slopeB = (B2.y - B1.y) / (B2.x - B1.x);

    if (slopeA == slopeB) {
      
      Vector PointOnA = new Vector(0, 0, pixelsToMeter);
      // A1.y - slopeA * A1.x = b
      PointOnA.y = A1.y - slopeA * A1.x;
      
      return PointOnA.distToLine(B1, B2);
    } else {
      
      // Vector LineIntercept = new Vector(0, 0, pixelsToMeter);
      // LineIntercept.x = (slopeA * A1.x - slopeB * B1.x + B1.y - A1.y) / (slopeA - slopeB);
      // LineIntercept.y = slopeA * (LineIntercept.x - A1.x) + A1.y;
      Vector LineIntercept = A1.InterceptPoint(slopeB, B1);
      
      // Find distance two both points of line segments and note on which side of the intersection point that they land
      // Create two vectors, representing which "quadrant" the points lie on relative to the Intersection
      // To Check if the Line segment 'saddles' the intersection, multiplying the Vectors should result in a (-x, -y)
      
      Vector QuadA1 = LineIntercept.subtract(A1);
      Vector QuadA2 = LineIntercept.subtract(A2);
      Vector QuadB1 = LineIntercept.subtract(B1);
      Vector QuadB2 = LineIntercept.subtract(B2);
      
      
      // Maybe make a Vector.operand method
      // If both points of each line segment land on opposite sides of the intersection point, then distance is 0
      if (QuadA1.multiplyEW(QuadA2).x <= 0 && QuadA1.multiplyEW(QuadA2).y <= 0
          && QuadB1.multiplyEW(QuadB2).x <= 0 && QuadB1.multiplyEW(QuadB2).y <= 0) {
          return 0;
      } else {
        
        // Pick the point closest to the intersection
        // If the line perpendicular to the other line segment through the point is within the bounds of the other line segment
        // then return that distance
        // Else, calculate all distances between the endpoints and return the shortest one
        float[] dist = {A1.distToPoint(B1), A2.distToPoint(B1),
                        B2.distToPoint(A1), B2.distToPoint(A2)};
        int minIndex = 0;
        for (int i = 0; i < dist.length; i ++) {
          if (dist[i] < dist[minIndex]) {
            minIndex = i;
          }
        }
        return dist[minIndex];
      }
    }
  };
  
  float distLineSegmentToPoint(Vector A1, Vector A2, Vector P) {
    
    return 0;
  }
  
  void debug() {
    stroke(255, 0, 0);
    strokeWeight(7);
    point(x * pixelsToMeter, y * pixelsToMeter);
    
    if (!isBox) {
    } else {
      
      for (int i = 0; i < BoxCorners.length; i ++) {
        BoxCorners[i].plotPoint();
        
        strokeWeight(2);
        line(BoxCorners[i].x * pixelsToMeter, BoxCorners[i].y * pixelsToMeter,
             BoxCorners[(i + 1) % BoxCorners.length].x * pixelsToMeter,
             BoxCorners[(i + 1) % BoxCorners.length].y * pixelsToMeter);
      }
    }
  }
}
