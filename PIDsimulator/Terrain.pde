class Terrain {
  float[] points;
  int pixelsToMeter;
  
  Terrain(float[] points, int pixelsToMeter) {
    this.points = points;
    this.pixelsToMeter = pixelsToMeter;
  };
  
  int terrainPointCount = terrain.length;
  void drawTerrain(int numPoints, float[] points) {
    strokeWeight(5);
    stroke(75);
    for(int i = 0; i < numPoints - 1; i ++) {
      line(i * pixelsToMeter, points[i] * pixelsToMeter, (i + 1) * pixelsToMeter, points[i + 1] * pixelsToMeter);
    }
  }
  
  // Collision detection
  // - Requires a hitbox class (circle with radius)
  // - Points in space are going to be a pain
}
