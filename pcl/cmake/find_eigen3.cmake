if(WIN32)
    set(eigen3_INCLUDE_DIR "/usr" CACHE PATH "Location of the Eigen3 includes.")
else(WIN32)
    include(FindPkgConfig)
    if(PKG_CONFIG_FOUND)
        pkg_check_modules(eigen3 REQUIRED eigen3)
    else(PKG_CONFIG_FOUND)
        message(FATAL_ERROR "Could not find pkg-config to search for Eigen3.")
    endif(PKG_CONFIG_FOUND)
endif(WIN32)

