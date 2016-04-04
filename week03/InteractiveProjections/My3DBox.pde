class My3DBox {
  My3DPoint[] p;
  My3DBox(My3DPoint origin, float dimX, float dimY, float dimZ) {
    float x = origin.x;
    float y = origin.y;
    float z = origin.z;
    this.p = new My3DPoint[] {new My3DPoint(x, y+dimY, z+dimZ), 
      new My3DPoint(x, y, z+dimZ), 
      new My3DPoint(x+dimX, y, z+dimZ), 
      new My3DPoint(x+dimX, y+dimY, z+dimZ), 
      new My3DPoint(x, y+dimY, z), 
      origin, 
      new My3DPoint(x+dimX, y, z), 
      new My3DPoint(x+dimX, y+dimY, z)
    };
  } 
  My3DBox(My3DPoint[] p) {
    this.p = p.clone();
  }
  My3DBox(My3DBox box) {
    this.p = box.p.clone();
  }
  My2DBox projectBox (My3DPoint eye) {
    My2DPoint[] points = new My2DPoint[8];
    for (int i = 0; i < 8; ++i) {
      points[i] = p[i].projectPoint(eye);
    }
    return new My2DBox(points);
  }
  My3DBox transformBox(float[][] transformMatrix) {
    My3DPoint[] points = new My3DPoint[8];
    for (int i = 0; i < points.length; ++i) {
      points[i] = euclidian3DPoint(matrixProduct(transformMatrix, p[i].homogeneous3DPoint()));
    }
    return new My3DBox(points);
  }
  
  My3DPoint euclidian3DPoint (float[] a) {
  My3DPoint result = new My3DPoint(a[0]/a[3], a[1]/a[3], a[2]/a[3]);
  return result;
}
}