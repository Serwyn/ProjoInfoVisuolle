float[][] matrixProduct(float[][]m1, float[][] m2) {
  if (m1[0].length != m2.length) throw new IllegalArgumentException("Bad matrix in argument");
  float[][] res = new float[m1.length][m2[0].length];
  float sum = 0.0;
  for ( int c = 0; c < m1.length; c++ ) {
    for ( int d = 0; d < m2[0].length; d++ ) {   
      for ( int k = 0; k < m2.length; k++ ) {
        sum += m1[c][k]*m2[k][d];
      }
      res[c][d] = sum;
      sum = 0;
    }
  }
  return res;
}

float[] matrixProduct(float[][] mat, float[] vect) {
  if (mat[0].length != vect.length) throw new IllegalArgumentException("Bad matrix in argument");
  float[] res = new float[mat.length];
  float sum = 0f;
  for (int i = 0; i < mat.length; ++i) {  
    for (int j = 0; j < vect.length; ++j) {
      sum += mat[i][j] * vect[j];
    }
    res[i] = sum;
    sum = 0f;
  }
  return res;
}