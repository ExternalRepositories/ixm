include_guard(GLOBAL)

function (target_compile_definitions target)
  alias_of(${target} target)
  _target_compile_definitions(${target} ${ARGN})
endfunction()

function (target_compile_features target)
  alias_of(${target} target)
  _target_compile_features(${target} ${ARGN})
endfunction()

function (target_compile_options target)
  alias_of(${target} target)
  _target_compile_options(${target} ${ARGN})
endfunction()

function (target_include_directories target)
  alias_of(${target} target)
  _target_include_directories(${target} ${ARGN})
endfunction()

function (target_link_directories target)
  alias_of(${target} target)
  _target_link_directories(${target} ${ARGN})
endfunction()

function (target_link_libraries target)
  alias_of(${target} target)
  _target_link_libraries(${target} ${ARGN})
endfunction()

function (target_link_options target)
  alias_of(${target} target)
  _target_link_options(${target} ${ARGN})
endfunction()

function (target_sources target)
  argparse(${ARGN}
    @FLAGS RECURSE
    @ARGS=* INTERFACE PUBLIC PRIVATE)
  set(glob GLOB)
  if (RECURSE)
    set(glob GLOB_RECURSE)
  endif()

  alias_of(${target} target)
  foreach (var IN ITEMS PRIVATE PUBLIC INTERFACE)
    if (NOT DEFINED ${var})
      continue()
    endif()
    foreach (entry IN LISTS ${var})
      if (entry MATCHES "[*?]|[0-9][0-9]*")
        file(${glob} entry CONFIGURE_DEPENDS ${entry})
      endif()
      list(APPEND sources ${entry})
    endforeach()
    _target_sources(${target} ${var} ${sources})
  endforeach()
endfunction()

function (target_properties target)
  set_target_properties(${target} PROPERTIES ${ARGN})
endfunction()

function (set_target_properties)
  argparse(${ARGN} @ARGS=* PROPERTIES)
  foreach (target IN LISTS REMAINDER)
    alias_of(${target} target)
    list(APPEND targets ${target})
  endforeach()
  list(LENGTH PROPERTIES length)
  return(length EQUAL 1)
  _set_target_properties(${targets} PROPERTIES ${PROPERTIES})
endfunction()

