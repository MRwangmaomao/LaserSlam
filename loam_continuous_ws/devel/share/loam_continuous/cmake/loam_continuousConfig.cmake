# generated from catkin/cmake/template/pkgConfig.cmake.in

# append elements to a list and remove existing duplicates from the list
# copied from catkin/cmake/list_append_deduplicate.cmake to keep pkgConfig
# self contained
macro(_list_append_deduplicate listname)
  if(NOT "${ARGN}" STREQUAL "")
    if(${listname})
      list(REMOVE_ITEM ${listname} ${ARGN})
    endif()
    list(APPEND ${listname} ${ARGN})
  endif()
endmacro()

# append elements to a list if they are not already in the list
# copied from catkin/cmake/list_append_unique.cmake to keep pkgConfig
# self contained
macro(_list_append_unique listname)
  foreach(_item ${ARGN})
    list(FIND ${listname} ${_item} _index)
    if(_index EQUAL -1)
      list(APPEND ${listname} ${_item})
    endif()
  endforeach()
endmacro()

# pack a list of libraries with optional build configuration keywords
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_pack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  set(_argn ${ARGN})
  list(LENGTH _argn _count)
  set(_index 0)
  while(${_index} LESS ${_count})
    list(GET _argn ${_index} lib)
    if("${lib}" MATCHES "^(debug|optimized|general)$")
      math(EXPR _index "${_index} + 1")
      if(${_index} EQUAL ${_count})
        message(FATAL_ERROR "_pack_libraries_with_build_configuration() the list of libraries '${ARGN}' ends with '${lib}' which is a build configuration keyword and must be followed by a library")
      endif()
      list(GET _argn ${_index} library)
      list(APPEND ${VAR} "${lib}${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}${library}")
    else()
      list(APPEND ${VAR} "${lib}")
    endif()
    math(EXPR _index "${_index} + 1")
  endwhile()
endmacro()

# unpack a list of libraries with optional build configuration keyword prefixes
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_unpack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  foreach(lib ${ARGN})
    string(REGEX REPLACE "^(debug|optimized|general)${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}(.+)$" "\\1;\\2" lib "${lib}")
    list(APPEND ${VAR} "${lib}")
  endforeach()
endmacro()


if(loam_continuous_CONFIG_INCLUDED)
  return()
endif()
set(loam_continuous_CONFIG_INCLUDED TRUE)

# set variables for source/devel/install prefixes
if("TRUE" STREQUAL "TRUE")
  set(loam_continuous_SOURCE_PREFIX /home/wpr/LaserSlam/loam_continuous_ws/src/loam_continuous)
  set(loam_continuous_DEVEL_PREFIX /home/wpr/LaserSlam/loam_continuous_ws/devel)
  set(loam_continuous_INSTALL_PREFIX "")
  set(loam_continuous_PREFIX ${loam_continuous_DEVEL_PREFIX})
else()
  set(loam_continuous_SOURCE_PREFIX "")
  set(loam_continuous_DEVEL_PREFIX "")
  set(loam_continuous_INSTALL_PREFIX /home/wpr/LaserSlam/loam_continuous_ws/install)
  set(loam_continuous_PREFIX ${loam_continuous_INSTALL_PREFIX})
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "WARNING: package 'loam_continuous' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  message("${_msg}")
endif()

# flag project as catkin-based to distinguish if a find_package()-ed project is a catkin project
set(loam_continuous_FOUND_CATKIN_PROJECT TRUE)

if(NOT "/home/wpr/include/eigen3;/usr/include/pcl-1.8;/usr/include/eigen3;/usr/include;/usr/include/vtk-5.8;/usr/include/ni;/usr/include/openni2;/usr/local/include/opencv;/usr/local/include " STREQUAL " ")
  set(loam_continuous_INCLUDE_DIRS "")
  set(_include_dirs "/home/wpr/include/eigen3;/usr/include/pcl-1.8;/usr/include/eigen3;/usr/include;/usr/include/vtk-5.8;/usr/include/ni;/usr/include/openni2;/usr/local/include/opencv;/usr/local/include")
  foreach(idir ${_include_dirs})
    if(IS_ABSOLUTE ${idir} AND IS_DIRECTORY ${idir})
      set(include ${idir})
    elseif("${idir} " STREQUAL "include ")
      get_filename_component(include "${loam_continuous_DIR}/../../../include" ABSOLUTE)
      if(NOT IS_DIRECTORY ${include})
        message(FATAL_ERROR "Project 'loam_continuous' specifies '${idir}' as an include dir, which is not found.  It does not exist in '${include}'.  Ask the maintainer 'Ed Venator <evenator@swri.org>' to fix it.")
      endif()
    else()
      message(FATAL_ERROR "Project 'loam_continuous' specifies '${idir}' as an include dir, which is not found.  It does neither exist as an absolute directory nor in '/home/wpr/LaserSlam/loam_continuous_ws/src/loam_continuous/${idir}'.  Ask the maintainer 'Ed Venator <evenator@swri.org>' to fix it.")
    endif()
    _list_append_unique(loam_continuous_INCLUDE_DIRS ${include})
  endforeach()
endif()

set(libraries "/usr/lib/libpcl_common.so;/usr/lib/libpcl_kdtree.so;/usr/lib/libpcl_octree.so;/usr/lib/libpcl_search.so;/usr/lib/libpcl_sample_consensus.so;/usr/lib/libpcl_filters.so;/usr/lib/libpcl_features.so;/usr/lib/libpcl_io.so;/usr/lib/libpcl_keypoints.so;/usr/lib/libpcl_ml.so;/usr/lib/libpcl_segmentation.so;/usr/lib/libpcl_visualization.so;/usr/lib/libpcl_outofcore.so;/usr/lib/libpcl_stereo.so;/usr/lib/libpcl_surface.so;/usr/lib/libpcl_people.so;/usr/lib/libpcl_registration.so;/usr/lib/libpcl_recognition.so;/usr/lib/libpcl_tracking.so;/usr/lib/libpcl_apps.so;/usr/lib/x86_64-linux-gnu/libboost_system.so;/usr/lib/x86_64-linux-gnu/libboost_filesystem.so;/usr/lib/x86_64-linux-gnu/libboost_thread.so;/usr/lib/x86_64-linux-gnu/libboost_date_time.so;/usr/lib/x86_64-linux-gnu/libboost_iostreams.so;/usr/lib/x86_64-linux-gnu/libboost_serialization.so;/usr/lib/x86_64-linux-gnu/libboost_chrono.so;/usr/lib/x86_64-linux-gnu/libpthread.so;optimized;/usr/lib/x86_64-linux-gnu/libqhull.so;debug;/usr/lib/x86_64-linux-gnu/libqhull.so;/usr/lib/libOpenNI.so;/usr/lib/libOpenNI2.so;optimized;/usr/lib/x86_64-linux-gnu/libflann_cpp.so;debug;/usr/lib/x86_64-linux-gnu/libflann_cpp.so;/usr/lib/libvtkCommon.so.5.8.0;/usr/lib/libvtkFiltering.so.5.8.0;/usr/lib/libvtkImaging.so.5.8.0;/usr/lib/libvtkGraphics.so.5.8.0;/usr/lib/libvtkGenericFiltering.so.5.8.0;/usr/lib/libvtkIO.so.5.8.0;/usr/lib/libvtkRendering.so.5.8.0;/usr/lib/libvtkVolumeRendering.so.5.8.0;/usr/lib/libvtkHybrid.so.5.8.0;/usr/lib/libvtkWidgets.so.5.8.0;/usr/lib/libvtkParallel.so.5.8.0;/usr/lib/libvtkInfovis.so.5.8.0;/usr/lib/libvtkGeovis.so.5.8.0;/usr/lib/libvtkViews.so.5.8.0;/usr/lib/libvtkCharts.so.5.8.0;/usr/local/lib/libopencv_videostab.so.2.4.11;/usr/local/lib/libopencv_video.so.2.4.11;/usr/local/lib/libopencv_superres.so.2.4.11;/usr/local/lib/libopencv_stitching.so.2.4.11;/usr/local/lib/libopencv_photo.so.2.4.11;/usr/local/lib/libopencv_ocl.so.2.4.11;/usr/local/lib/libopencv_objdetect.so.2.4.11;/usr/local/lib/libopencv_nonfree.so.2.4.11;/usr/local/lib/libopencv_ml.so.2.4.11;/usr/local/lib/libopencv_legacy.so.2.4.11;/usr/local/lib/libopencv_imgproc.so.2.4.11;/usr/local/lib/libopencv_highgui.so.2.4.11;/usr/local/lib/libopencv_gpu.so.2.4.11;/usr/local/lib/libopencv_flann.so.2.4.11;/usr/local/lib/libopencv_features2d.so.2.4.11;/usr/local/lib/libopencv_core.so.2.4.11;/usr/local/lib/libopencv_contrib.so.2.4.11;/usr/local/lib/libopencv_calib3d.so.2.4.11")
foreach(library ${libraries})
  # keep build configuration keywords, target names and absolute libraries as-is
  if("${library}" MATCHES "^(debug|optimized|general)$")
    list(APPEND loam_continuous_LIBRARIES ${library})
  elseif(TARGET ${library})
    list(APPEND loam_continuous_LIBRARIES ${library})
  elseif(IS_ABSOLUTE ${library})
    list(APPEND loam_continuous_LIBRARIES ${library})
  else()
    set(lib_path "")
    set(lib "${library}-NOTFOUND")
    # since the path where the library is found is returned we have to iterate over the paths manually
    foreach(path /home/wpr/LaserSlam/loam_continuous_ws/devel/lib;/home/wpr/code/catkin_grad/devel/lib;/home/wpr/code/catkin_turtle/devel/lib;/home/wpr/code/ORB_SLAM2_Map_Catkin/Examples/ROS/ORB_SLAM2_Map/devel/lib;/home/wpr/code/ORB_SLAM2_Map/Examples/ROS/ORB_SLAM2_Map/build/devel/lib;/home/wpr/code/ORB_SLAM2/Examples/ROS/ORB_SLAM2/build/devel/lib;/home/wpr/code/catkin_kobuki/devel/lib;/home/wpr/catkin_ws/devel/lib;/opt/ros/indigo/lib)
      find_library(lib ${library}
        PATHS ${path}
        NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
      if(lib)
        set(lib_path ${path})
        break()
      endif()
    endforeach()
    if(lib)
      _list_append_unique(loam_continuous_LIBRARY_DIRS ${lib_path})
      list(APPEND loam_continuous_LIBRARIES ${lib})
    else()
      # as a fall back for non-catkin libraries try to search globally
      find_library(lib ${library})
      if(NOT lib)
        message(FATAL_ERROR "Project '${PROJECT_NAME}' tried to find library '${library}'.  The library is neither a target nor built/installed properly.  Did you compile project 'loam_continuous'?  Did you find_package() it before the subdirectory containing its code is included?")
      endif()
      list(APPEND loam_continuous_LIBRARIES ${lib})
    endif()
  endif()
endforeach()

set(loam_continuous_EXPORTED_TARGETS "")
# create dummy targets for exported code generation targets to make life of users easier
foreach(t ${loam_continuous_EXPORTED_TARGETS})
  if(NOT TARGET ${t})
    add_custom_target(${t})
  endif()
endforeach()

set(depends "geometry_msgs;nav_msgs;roscpp;rospy;std_msgs")
foreach(depend ${depends})
  string(REPLACE " " ";" depend_list ${depend})
  # the package name of the dependency must be kept in a unique variable so that it is not overwritten in recursive calls
  list(GET depend_list 0 loam_continuous_dep)
  list(LENGTH depend_list count)
  if(${count} EQUAL 1)
    # simple dependencies must only be find_package()-ed once
    if(NOT ${loam_continuous_dep}_FOUND)
      find_package(${loam_continuous_dep} REQUIRED)
    endif()
  else()
    # dependencies with components must be find_package()-ed again
    list(REMOVE_AT depend_list 0)
    find_package(${loam_continuous_dep} REQUIRED ${depend_list})
  endif()
  _list_append_unique(loam_continuous_INCLUDE_DIRS ${${loam_continuous_dep}_INCLUDE_DIRS})

  # merge build configuration keywords with library names to correctly deduplicate
  _pack_libraries_with_build_configuration(loam_continuous_LIBRARIES ${loam_continuous_LIBRARIES})
  _pack_libraries_with_build_configuration(_libraries ${${loam_continuous_dep}_LIBRARIES})
  _list_append_deduplicate(loam_continuous_LIBRARIES ${_libraries})
  # undo build configuration keyword merging after deduplication
  _unpack_libraries_with_build_configuration(loam_continuous_LIBRARIES ${loam_continuous_LIBRARIES})

  _list_append_unique(loam_continuous_LIBRARY_DIRS ${${loam_continuous_dep}_LIBRARY_DIRS})
  list(APPEND loam_continuous_EXPORTED_TARGETS ${${loam_continuous_dep}_EXPORTED_TARGETS})
endforeach()

set(pkg_cfg_extras "")
foreach(extra ${pkg_cfg_extras})
  if(NOT IS_ABSOLUTE ${extra})
    set(extra ${loam_continuous_DIR}/${extra})
  endif()
  include(${extra})
endforeach()
