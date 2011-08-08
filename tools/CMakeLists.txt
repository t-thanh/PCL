set (SUBSYS_NAME tools)
set (SUBSYS_DESC "Useful PCL-based command line tools")
set (SUBSYS_DEPS common io filters sample_consensus segmentation kdtree features surface octree registration)

PCL_SUBSYS_OPTION (build ${SUBSYS_NAME} ${SUBSYS_DESC} ${DEFAULT} ${REASON})
PCL_SUBSYS_DEPEND (build ${SUBSYS_NAME} ${SUBSYS_DEPS})

if (build)

  PCL_ADD_EXECUTABLE (plane_projection ${SUBSYS_NAME} plane_projection.cpp)
  target_link_libraries (plane_projection pcl_common pcl_io pcl_sample_consensus)

  PCL_ADD_EXECUTABLE (normal_estimation ${SUBSYS_NAME} normal_estimation.cpp)
  target_link_libraries (normal_estimation pcl_common pcl_io pcl_features pcl_kdtree)

  PCL_ADD_EXECUTABLE (boundary_estimation ${SUBSYS_NAME} boundary_estimation.cpp)
  target_link_libraries (boundary_estimation pcl_common pcl_io pcl_features pcl_kdtree)

  PCL_ADD_EXECUTABLE (fpfh_estimation ${SUBSYS_NAME} fpfh_estimation.cpp)
  target_link_libraries (fpfh_estimation pcl_common pcl_io pcl_features pcl_kdtree)

  PCL_ADD_EXECUTABLE (voxel_grid ${SUBSYS_NAME} voxel_grid.cpp)
  target_link_libraries (voxel_grid pcl_common pcl_io pcl_filters)
	
  PCL_ADD_EXECUTABLE (passthrough_filter ${SUBSYS_NAME} passthrough_filter.cpp)
  target_link_libraries (passthrough_filter pcl_common pcl_io pcl_filters)
	
  PCL_ADD_EXECUTABLE (extract_feature ${SUBSYS_NAME} extract_feature.cpp)
  target_link_libraries (extract_feature pcl_common pcl_io pcl_features pcl_kdtree)

endif ()