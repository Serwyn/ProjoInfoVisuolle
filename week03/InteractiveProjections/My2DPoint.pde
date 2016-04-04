class My2DPoint {
  float x;
  float y;

  My2DPoint(float x, float y) {
    this.x = x;
    this.y = y;
  }

  float[] toArray() {
    float[] res = {x, y};
    return res;
  }
}