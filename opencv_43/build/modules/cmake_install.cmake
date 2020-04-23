# Install script for directory: C:/opencv/opencv/modules

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/opencv/opencv/build/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xlicensesx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/etc/licenses" TYPE FILE RENAME "ade-LICENSE" FILES "C:/opencv/opencv/build/3rdparty/ade/ade-0.1.1f/LICENSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xlicensesx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/etc/licenses" TYPE FILE RENAME "ffmpeg-license.txt" FILES "C:/opencv/opencv/3rdparty/ffmpeg/license.txt")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xlicensesx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/etc/licenses" TYPE FILE RENAME "ffmpeg-readme.txt" FILES "C:/opencv/opencv/3rdparty/ffmpeg/readme.txt")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("C:/opencv/opencv/build/modules/.firstpass/calib3d/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/core/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/dnn/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/features2d/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/flann/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/gapi/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/highgui/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/imgcodecs/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/imgproc/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/java/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/js/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/ml/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/objdetect/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/photo/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/python/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/stitching/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/ts/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/video/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/videoio/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/world/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/alphamat/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/aruco/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/bgsegm/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/bioinspired/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/ccalib/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/cnn_3dobj/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/cudaarithm/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/cudabgsegm/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/cudacodec/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/cudafeatures2d/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/cudafilters/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/cudaimgproc/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/cudalegacy/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/cudaobjdetect/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/cudaoptflow/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/cudastereo/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/cudawarping/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/cudev/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/cvv/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/datasets/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/dnn_objdetect/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/dnn_superres/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/dpm/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/face/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/freetype/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/fuzzy/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/hdf/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/hfs/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/img_hash/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/intensity_transform/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/line_descriptor/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/matlab/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/optflow/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/ovis/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/phase_unwrapping/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/plot/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/quality/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/rapid/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/reg/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/rgbd/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/saliency/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/sfm/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/shape/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/stereo/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/structured_light/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/superres/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/surface_matching/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/text/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/tracking/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/videostab/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/viz/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/xfeatures2d/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/ximgproc/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/xobjdetect/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/.firstpass/xphoto/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/java_bindings_generator/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/python_tests/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/world/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/img_hash/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/python_bindings_generator/cmake_install.cmake")
  include("C:/opencv/opencv/build/modules/ts/cmake_install.cmake")

endif()

