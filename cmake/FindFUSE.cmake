# Find the FUSE includes and library
#
#  FUSE_INCLUDE_DIRSS - where to find fuse.h, etc.
#  FUSE_LIBRARIES   - List of libraries when using FUSE.
#  FUSE_FOUND       - True if FUSE lib is found.

# check if already in cache, be silent
IF (FUSE_INCLUDE_DIRS)
        SET (FUSE_FIND_QUIETLY TRUE)
ENDIF (FUSE_INCLUDE_DIRS)

if (APPLE)
    set (FUSE_NAMES libosxfuse.dylib fuse)
    set (FUSE_SUFFIXES osxfuse fuse)
elseif(WINDOWS)
    set (FUSE_NAMES libdokanfuse1)
    set (FUSE_SUFFIXES dokanfuse1)
else()
    set(FUSE_NAMES fuse)
    set(FUSE_SUFFIXES fuse)
endif()

# find includes
find_path (FUSE_INCLUDE_DIR fuse.h
        PATHS /opt /opt/local /usr/pkg
        PATH_SUFFIXES ${FUSE_SUFFIXES})

# find lib
find_library (FUSE_LIBRARIES NAMES ${FUSE_NAMES})

include ("FindPackageHandleStandardArgs")
find_package_handle_standard_args ("FUSE" DEFAULT_MSG
    FUSE_INCLUDE_DIR FUSE_LIBRARIES)

mark_as_advanced (FUSE_INCLUDE_DIRS FUSE_LIBRARIES FUSE_LIBRARY_DIRS)
