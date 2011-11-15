set(SUBSYS_NAME simulation)
set(SUBSYS_DESC "Point Cloud Library Simulation")
set(SUBSYS_DEPS common io)

set(build TRUE)
PCL_SUBSYS_OPTION(build ${SUBSYS_NAME} ${SUBSYS_DESC} ON)
PCL_SUBSYS_DEPEND(build ${SUBSYS_NAME} DEPS ${SUBSYS_DEPS} OPT_DEPS openni vtk)

if(build)


    set(srcs 
         src/camera.cpp
         src/model.cpp
         src/range_likelihood.cpp
         src/scene.cpp
        )

    set(incs 
        include/pcl/${SUBSYS_NAME}/camera.hpp
        include/pcl/${SUBSYS_NAME}/model.hpp
        include/pcl/${SUBSYS_NAME}/range_likelihood.hpp
        include/pcl/${SUBSYS_NAME}/scene.hpp
        )


#    set(impl_incs 
#        include/pcl/${SUBSYS_NAME}/impl/pcd_io.hpp
#       )

    set(LIB_NAME pcl_${SUBSYS_NAME})
    include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include ${VTK_INCLUDE_DIRECTORIES})
    link_directories(${VTK_LINK_DIRECTORIES})
    PCL_ADD_LIBRARY(${LIB_NAME} ${SUBSYS_NAME} ${srcs} ${incs} ${compression_incs} ${impl_incs} ${OPENNI_INCLUDES})
    PCL_ADD_SSE_FLAGS(${LIB_NAME})
    target_link_libraries(${LIB_NAME} pcl_common ${VTK_IO_TARGET_LINK_LIBRARIES})

    set(EXT_DEPS eigen3)
    PCL_MAKE_PKGCONFIG(${LIB_NAME} ${SUBSYS_NAME} "${SUBSYS_DESC}"
      "${SUBSYS_DEPS}" "${EXT_DEPS}" "" "" "")

    # Install include files
    PCL_ADD_INCLUDES(${SUBSYS_NAME} ${SUBSYS_NAME} ${incs})
    PCL_ADD_INCLUDES(${SUBSYS_NAME} ${SUBSYS_NAME}/impl ${impl_incs})

    add_subdirectory(tools)
    #add_subdirectory(test)
endif(build)