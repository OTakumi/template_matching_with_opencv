# CMake generated Testfile for 
# Source directory: C:/opencv/opencv_contrib/modules/img_hash
# Build directory: C:/opencv/opencv/build/modules/img_hash
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
if("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(opencv_test_img_hash "C:/opencv/opencv/build/bin/Debug/opencv_test_img_hashd.exe" "--gtest_output=xml:opencv_test_img_hash.xml")
  set_tests_properties(opencv_test_img_hash PROPERTIES  LABELS "Extra;opencv_img_hash;Accuracy" WORKING_DIRECTORY "C:/opencv/opencv/build/test-reports/accuracy" _BACKTRACE_TRIPLES "C:/opencv/opencv/cmake/OpenCVUtils.cmake;1640;add_test;C:/opencv/opencv/cmake/OpenCVModule.cmake;1309;ocv_add_test_from_target;C:/opencv/opencv/cmake/OpenCVModule.cmake;1073;ocv_add_accuracy_tests;C:/opencv/opencv_contrib/modules/img_hash/CMakeLists.txt;3;ocv_define_module;C:/opencv/opencv_contrib/modules/img_hash/CMakeLists.txt;0;")
elseif("${CTEST_CONFIGURATION_TYPE}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(opencv_test_img_hash "C:/opencv/opencv/build/bin/Release/opencv_test_img_hash.exe" "--gtest_output=xml:opencv_test_img_hash.xml")
  set_tests_properties(opencv_test_img_hash PROPERTIES  LABELS "Extra;opencv_img_hash;Accuracy" WORKING_DIRECTORY "C:/opencv/opencv/build/test-reports/accuracy" _BACKTRACE_TRIPLES "C:/opencv/opencv/cmake/OpenCVUtils.cmake;1640;add_test;C:/opencv/opencv/cmake/OpenCVModule.cmake;1309;ocv_add_test_from_target;C:/opencv/opencv/cmake/OpenCVModule.cmake;1073;ocv_add_accuracy_tests;C:/opencv/opencv_contrib/modules/img_hash/CMakeLists.txt;3;ocv_define_module;C:/opencv/opencv_contrib/modules/img_hash/CMakeLists.txt;0;")
else()
  add_test(opencv_test_img_hash NOT_AVAILABLE)
endif()
