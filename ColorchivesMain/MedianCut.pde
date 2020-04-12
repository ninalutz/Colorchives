class MedianCut{
  /*
  Median cut is a nice extension of the simple histogram approach. 
  Instead of creating a fixed histogram grid, median cut partitions the space in a more intelligent way.
  There are a few ways you can choose to implement median cut. I’ve used the following method:
  Compute the range of pixel values for each dimension (red, green, and blue).
  Select the dimension with the largest range.
  Compute the median pixel value for that dimension.
  Split the pixels into two groups, one below the median pixel value and one above.
  Repeat the process recursively.
  Instead of recursing on each sub-group, my implementation looks at all 
  existing sub-groups and only partitions one of them during each iteration – 
  the one with the largest range along some dimension. Therefore, after four iterations (or partitions), 
  it will have produced five sub-groups. You could alternatively split every sub-group during every iteration.
  If you did this, you would have 16 groups after running 4 iterations.
  */

Plotter p;

MedianCut(){}

MedianCut(Plotter _p){
  p = _p;
}

}
