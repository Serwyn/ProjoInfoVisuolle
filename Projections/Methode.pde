My3DBox transformBox(My3DBox box, float[][] transformMatrix) {
  My3DPoint[] points = new My3DPoint[box.p.length];
  for (int i=0; i < box.p.length; i++) {
    points[i] = euclidian3DPoint(matrixProduct(transformMatrix, homogeneous3DPoint(box.p[i])));
  }
  return new My3DBox(points);
}

My3DPoint euclidian3DPoint (float[] a) {
  My3DPoint result = new My3DPoint(a[0]/a[3], a[1]/a[3], a[2]/a[3]);
  return new My3DPoint(result.x, result.y, result.z);
}

My2DPoint projectPoint(My3DPoint eye, My3DPoint p) {
  float Zp = 1 - p.z / eye.z;
  float Xp = (p.x - eye.x)/Zp;
  float Yp = (p.y - eye.y)/Zp;
  return new My2DPoint(Xp, Yp);
}


My2DBox projectBox (My3DPoint eye, My3DBox box) {
  My2DPoint points[] = new My2DPoint[8];
  for (int i = 0; i<box.p.length; ++i) {
    points[i] = projectPoint(eye, box.p[i]);
  }
  return new My2DBox(points);
}

float[] homogeneous3DPoint (My3DPoint p) {
  float[] result = {p.x, p.y, p.z, 1};
  return result;
}
float[] matrixProduct(float[][] a, float[] b) {
  float[] result = new float[b.length];
  for (int i = 0; i < a.length; i++) {
    result[i] = 0f;
    for (int j = 0; j < a[0].length; j++) {
      result[i] += a[i][j]*b[j];
    }
  }
  return result;
}