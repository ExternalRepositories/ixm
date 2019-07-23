include_guard(GLOBAL)

function (ixm_coven_detect_docs)
  ixm_coven_detect_directory(found "docs")
  if (NOT found)
    return()
  endif()
  ixm_coven_detect_gohugo(gohugo-found)
  ixm_coven_detect_jekyll(jekyll-found)
  ixm_coven_detect_mkdocs(mkdocs-found)
  ixm_coven_detect_sphinx(sphinx-found)
  if (gohugo-found)
    dict(INSERT coven::${PROJECT_NAME} GOHUGO ON)
    dict(INSERT coven::${PROJECT_NAME} DOCS ON)
    return()
  endif()

  if (jekyll-found)
    dict(INSERT coven::${PROJECT_NAME} JEKYLL ON)
    dict(INSERT coven::${PROJECT_NAME} DOCS ON)
    return()
  endif()

  if (mkdocs-found)
    dict(INSERT coven::${PROJECT_NAME} MKDOCS ON)
    dict(INSERT coven::${PROJECT_NAME} DOCS ON)
    return()
  endif()

  if (sphinx-found)
    dict(INSERT coven::${PROJECT_NAME} SPHINX ON)
    dict(INSERT coven::${PROJECT_NAME} DOCS ON)
  endif()
endfunction()