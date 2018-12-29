include(Dump)

set(CMAKE_Cython_COMPILE_OBJECT
  "<CMAKE_Cython_COMPILER> -${CMAKE_Cython_SYNTAX} ${CMAKE_Cython_CXX} <INCLUDES> <FLAGS> -o <OBJECT> <SOURCE>")

message(STATUS "LANG: ${CMAKE_Cython_LANG}")
list(APPEND CMAKE_Cython_COMPILE_OBJECT ${CMAKE_${CMAKE_Cython_LANG}_COMPILE_OBJECT})
set(CMAKE_Cython_CREATE_STATIC_LIBRARY ${CMAKE_${CMAKE_Cython_LANG}_STATIC_LIBRARY})
set(CMAKE_Cython_CREATE_SHARED_MODULE ${CMAKE_${CMAKE_Cython_LANG}_CREATE_SHARED_MODULE})

dump(CMAKE_Cython_CREATE_STATIC_LIBRARY)
dump(CMAKE_Cython_CREATE_SHARED_MODULE)
dump(CMAKE_Cython_COMPILE_OBJECT)

if (NOT DEFINED CMAKE_Cython_ARCHIVE_CREATE)
  set(CMAKE_Cython_ARCHIVE_CREATE "<CMAKE_AR> qc <TARGET> <LINK_FLAGS> <OBJECTS>")
endif()
if (NOT DEFINED CMAKE_Cython_ARCHIVE_APPEND)
  set(CMAKE_Cython_ARCHIVE_APPEND "<CMAKE_AR> q <TARGET> <LINK_FLAGS> <OBJECTS>")
endif()
if (NOT DEFINED CMAKE_Cython_ARCHIVE_FINISH)
  set(CMAKE_Cython_ARCHIVE_FINISH "<CMAKE_RANLIB> <TARGET>")
endif()
