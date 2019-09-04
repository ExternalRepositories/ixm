include_guard(GLOBAL)

function (ixm_attribute_get out-var)
  void(DOMAIN NAME TARGET PROPERTY value)
  parse(${ARGN} @ARGS=? DOMAIN NAME TARGET PROPERTY)
  if (DEFINED TARGET AND DEFINED NAME)
    log(FATAL "attribute(GET) can only take NAME or TARGET")
  endif()
  if (NAME)
    # XXX: Is it safe to lowercase the PROJECT_NAME?
    # TODO: Is it safe to memoize the 'static' part of this list as a directory
    # property?
    string(TOLOWER "${NAME}" name)
    string(TOLOWER "${DOMAIN}" domain)
    string(TOLOWER "${PROJECT_NAME}" project)
    string(TOLOWER "${IXM_CURRENT_BLUEPRINT_NAME}" blueprint)
    get_property(domain GLOBAL PROPERTY "attr:${domain}:${name}")
    get_property(project GLOBAL PROPERTY "attr:${project}:${name}")
    get_property(blueprint GLOBAL PROPERTY "attr:${blueprint}:${name}")
    get_property(global GLOBAL PROPERTY "attr:ixm:${name}")
    assign(value ? domain project global)
    if (DEFINED value)
      set(${out-var} ${value} PARENT_SCOPE)
    endif()
  endif()
endfunction()