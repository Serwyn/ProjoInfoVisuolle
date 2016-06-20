PImage sobel(PImage img) {
  float[][] hKernel = { { 0, 1, 0 }, 
    { 0, 0, 0 }, 
    { 0, -1, 0 } };
  float[][] vKernel = { { 0, 0, 0 }, 
    { 1, 0, -1 }, 
    { 0, 0, 0 } };
  PImage result = createImage(img.width, img.height, ALPHA);
  // clear the image
  for (int i = 0; i < img.width * img.height; i++) {
    result.pixels[i] = color(0);
  }
  float max = 0;
  float[] buffer = new float[img.width * img.height];
  int borderSize = 1;
  int N = 3; // kernel size
  // *************************************
  // Implement here the double convolution
  for (int x = borderSize; x < img.width - borderSize; ++x) {
    for (int y = borderSize; y < img.height - borderSize; ++y) {
      float sum_h = 0;
      float sum_v = 0;
      for (int i = -N/2; i <= N/2; ++i) {
        for (int j =  -N/2; j <= N/2; ++j) {
          int idx = x + i + img.width*(y + j);
          sum_h += img.pixels[idx] * hKernel[i+(N/2)][j+(N/2)];
          sum_v += img.pixels[idx] * vKernel[i+(N/2)][j+(N/2)];
        }
      }
      float sum = sqrt(pow(sum_h, 2) + pow(sum_v, 2));
      max = max < sum ? sum : max;
      buffer[x + y * img.width] = sum;
    }
  }

  // *************************************
  for (int y = 2; y < img.height - 2; y++) { // Skip top and bottom edges
    for (int x = 2; x < img.width - 2; x++) { // Skip left and right
      if (buffer[y * img.width + x] > (int)(max * 0.2f)) { // 30% of the max
        result.pixels[y * img.width + x] = color(255);
      } else {
        result.pixels[y * img.width + x] = color(0);
      }
    }
  }
  return result;
}