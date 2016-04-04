class My3DPoint {
  float x;
  float y;
  float z;

  My3DPoint(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
  float[] toArray() {
    float[] res = {x, y, z};
    return res;
  }

  float[] homogeneous3DPoint() {
    float[] result = {this.x, this.y, this.z, 1};
    return result;
  }

  My2DPoint projectPoint(My3DPoint eye) {
    float[][] projection = 
      {{1, 0, 0, -eye.x}, 
      {0, 1, 0, -eye.y}, 
      {0, 0, 1, -eye.z}, 
      {0, 0, 0, 1}     };
    float[][] transformation = 
      {{1, 0, 0, 0}, 
      {0, 1, 0, 0}, 
      {0, 0, 1, 0}, 
      {0, 0, 1/eye.z, 0}};
    float[][] proTra = matrixProduct(projection, transformation);
    float[] point = homogeneous3DPoint();
    float[] res = matrixProduct(proTra, point);

    return new My2DPoint(res[0], res[1]);
  }
}