set image [image create rtdimage ...]
$canvas create image 0 0 -image $image ...

# create and pack RtdImage pack [RtdImage .image -scrollbars 1] -fill both
# -expand 1 # load a test image, set the cut levels, scale 3x .image config
# -file test.fits .image cut 0 1000 .image scale 3 3
