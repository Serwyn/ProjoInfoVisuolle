PImage convolute(PImage img, float[][] kernel, float weight) {

  // create a greyscale image (type: ALPHA) for output
  PImage result = createImage(img.width, img.height, ALPHA);
  img.loadPixels();
  result.loadPixels();

  int borderSize = 1;
  int kernelSize = 3;
  int N = kernel.length;
  //
  // for each (x,y) pixel in the image:
  // - multiply intensities for pixels in the range
  // (x - N/2, y - N/2) to (x + N/2, y + N/2) by the
  // corresponding weights in the kernel matrix
  // - sum all these intensities and divide it by the weight
  // - set result.pixels[y * img.width + x] to this value
  for (int x = borderSize; x < img.width - borderSize; ++x) {
    for (int y = borderSize; y < img.height - borderSize; ++y) {
      float sum = 0;
      for (int i = -N/2; i <= N/2; ++i) {
        for (int j =  -N/2; j <= N/2; ++j) {
          int idx = x + i + img.width*(y + j);
          sum += brightness(img.pixels[idx]) * kernel[i+(kernelSize/2)][j+(kernelSize/2)];
        }
      }
      result.pixels[x + y * img.width] = color(min(sum/weight, 255));
    }
  }
  return result;
}



PImage gaussianBlur(PImage img) {
  float[][] gKernel = { { 9, 12, 9 }, 
    { 12, 15, 12 }, 
    { 9, 12, 9 } };
  return  convolute(img, gKernel, 10.f);
}