set(CLAZY_LIB_SRC
  ${CMAKE_CURRENT_LIST_DIR}/src/AccessSpecifierManager.cpp
  ${CMAKE_CURRENT_LIST_DIR}/src/checkbase.cpp
  ${CMAKE_CURRENT_LIST_DIR}/src/checkmanager.cpp
  ${CMAKE_CURRENT_LIST_DIR}/src/SuppressionManager.cpp
  ${CMAKE_CURRENT_LIST_DIR}/src/ContextUtils.cpp
  ${CMAKE_CURRENT_LIST_DIR}/src/FixItUtils.cpp
  ${CMAKE_CURRENT_LIST_DIR}/src/LoopUtils.cpp
  ${CMAKE_CURRENT_LIST_DIR}/src/PreProcessorVisitor.cpp
  ${CMAKE_CURRENT_LIST_DIR}/src/QtUtils.cpp
  ${CMAKE_CURRENT_LIST_DIR}/src/StringUtils.cpp
  ${CMAKE_CURRENT_LIST_DIR}/src/TemplateUtils.cpp
  ${CMAKE_CURRENT_LIST_DIR}/src/TypeUtils.cpp
  ${CMAKE_CURRENT_LIST_DIR}/src/Utils.cpp
)

if (NOT CLAZY_BUILD_IS_MINIMAL)
  set(CLAZY_SRCS
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level0/qcolor-from-literal.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level0/connect-non-signal.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level0/connect-not-normalized.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level0/container-anti-pattern.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level0/lambda-in-connect.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level0/qdatetimeutc.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level0/qenums.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level0/qfileinfo-exists.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level0/qgetenv.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level0/qmap-with-pointer-key.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level0/qstringarg.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level0/qstring-insensitive-allocation.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level0/qstringref.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level0/qt-macros.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level0/qt-modernize-qforeach-with-rvalues.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level0/qvariant-template-instantiation.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level0/mutable-container-key.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level0/strict-iterators.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level0/temporaryiterator.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level0/unused-non-trivial-variable.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level0/writingtotemporary.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level0/wrong-qglobalstatic.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level1/autounexpectedqstringbuilder.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level1/child-event-qobject-cast.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level1/detachingtemporary.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level1/foreach.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level1/inefficient-qlist-soft.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level1/install-event-filter.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level1/ctor-missing-parent-argument.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level1/missing-qobject-macro.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level1/nonpodstatic.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level1/qdeleteall.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level1/qstring-left.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level1/qlatin1string-non-ascii.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level1/range-loop.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level1/returning-data-from-temporary.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level1/ruleoftwosoft.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level1/post-event.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level1/incorrect-emit.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level2/base-class-event.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level2/container-inside-loop.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level2/function-args-by-ref.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level2/function-args-by-value.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level2/globalconstcharpointer.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level2/implicitcasts.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level2/missing-type-info.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level2/qstring-allocations.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level2/reservecandidates.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level2/ruleofthree.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level2/virtualcallsfromctor.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level2/returning-void-expression.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level2/copyable-polymorphic.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level3/assertwithsideeffects.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level3/detachingmember.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/level3/dynamic_cast.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/hiddenlevel/inefficientqlist.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/hiddenlevel/isempty-vs-count.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/hiddenlevel/tr-non-literal.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/hiddenlevel/qt4-qstring-from-array.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/detachingbase.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/inefficientqlistbase.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/requiredresults.cpp
    ${CMAKE_CURRENT_LIST_DIR}/src/checks/ruleofbase.cpp
  )
endif()

set(CLAZY_SRCS ${CLAZY_SRCS}
  ${CMAKE_CURRENT_LIST_DIR}/src/Clazy.cpp
  ${CMAKE_CURRENT_LIST_DIR}/src/ClazyContext.cpp
)

if (NOT CLAZY_BUILD_IS_MINIMAL)
  if(HAS_STD_REGEX)
    set(CLAZY_SRCS ${CLAZY_SRCS} ${CMAKE_CURRENT_LIST_DIR}/src/checks/level2/oldstyleconnect.cpp)
  endif()
endif()

if (NOT CLAZY_BUILD_UTILS_LIB)
  set(CLAZY_SRCS ${CLAZY_SRCS} ${CLAZY_LIB_SRC})
endif()
