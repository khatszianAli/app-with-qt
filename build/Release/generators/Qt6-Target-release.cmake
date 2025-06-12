# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(qt_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(qt_FRAMEWORKS_FOUND_RELEASE "${qt_FRAMEWORKS_RELEASE}" "${qt_FRAMEWORK_DIRS_RELEASE}")

set(qt_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET qt_DEPS_TARGET)
    add_library(qt_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET qt_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${qt_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${qt_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:opengl::opengl;Qt6::Core;Qt6::Gui;Qt6::Widgets;Qt6::OpenGL;Qt6::Network;Qt6::Qml;Qt6::UiPlugin;Qt6::Xml;Qt6::Sql>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### qt_DEPS_TARGET to all of them
conan_package_library_targets("${qt_LIBS_RELEASE}"    # libraries
                              "${qt_LIB_DIRS_RELEASE}" # package_libdir
                              "${qt_BIN_DIRS_RELEASE}" # package_bindir
                              "${qt_LIBRARY_TYPE_RELEASE}"
                              "${qt_IS_HOST_WINDOWS_RELEASE}"
                              qt_DEPS_TARGET
                              qt_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "qt"    # package_name
                              "${qt_NO_SONAME_MODE_RELEASE}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${qt_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## COMPONENTS TARGET PROPERTIES Release ########################################

    ########## COMPONENT Qt6::Designer #############

        set(qt_Qt6_Designer_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(qt_Qt6_Designer_FRAMEWORKS_FOUND_RELEASE "${qt_Qt6_Designer_FRAMEWORKS_RELEASE}" "${qt_Qt6_Designer_FRAMEWORK_DIRS_RELEASE}")

        set(qt_Qt6_Designer_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET qt_Qt6_Designer_DEPS_TARGET)
            add_library(qt_Qt6_Designer_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET qt_Qt6_Designer_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_Designer_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Designer_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Designer_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'qt_Qt6_Designer_DEPS_TARGET' to all of them
        conan_package_library_targets("${qt_Qt6_Designer_LIBS_RELEASE}"
                              "${qt_Qt6_Designer_LIB_DIRS_RELEASE}"
                              "${qt_Qt6_Designer_BIN_DIRS_RELEASE}" # package_bindir
                              "${qt_Qt6_Designer_LIBRARY_TYPE_RELEASE}"
                              "${qt_Qt6_Designer_IS_HOST_WINDOWS_RELEASE}"
                              qt_Qt6_Designer_DEPS_TARGET
                              qt_Qt6_Designer_LIBRARIES_TARGETS
                              "_RELEASE"
                              "qt_Qt6_Designer"
                              "${qt_Qt6_Designer_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET Qt6::Designer
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_Designer_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Designer_LIBRARIES_TARGETS}>
                     )

        if("${qt_Qt6_Designer_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET Qt6::Designer
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         qt_Qt6_Designer_DEPS_TARGET)
        endif()

        set_property(TARGET Qt6::Designer APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Designer_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET Qt6::Designer APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_Designer_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET Qt6::Designer APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_Designer_LIB_DIRS_RELEASE}>)
        set_property(TARGET Qt6::Designer APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Designer_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET Qt6::Designer APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Designer_COMPILE_OPTIONS_RELEASE}>)


    ########## COMPONENT Qt6::UiTools #############

        set(qt_Qt6_UiTools_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(qt_Qt6_UiTools_FRAMEWORKS_FOUND_RELEASE "${qt_Qt6_UiTools_FRAMEWORKS_RELEASE}" "${qt_Qt6_UiTools_FRAMEWORK_DIRS_RELEASE}")

        set(qt_Qt6_UiTools_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET qt_Qt6_UiTools_DEPS_TARGET)
            add_library(qt_Qt6_UiTools_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET qt_Qt6_UiTools_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_UiTools_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_UiTools_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_UiTools_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'qt_Qt6_UiTools_DEPS_TARGET' to all of them
        conan_package_library_targets("${qt_Qt6_UiTools_LIBS_RELEASE}"
                              "${qt_Qt6_UiTools_LIB_DIRS_RELEASE}"
                              "${qt_Qt6_UiTools_BIN_DIRS_RELEASE}" # package_bindir
                              "${qt_Qt6_UiTools_LIBRARY_TYPE_RELEASE}"
                              "${qt_Qt6_UiTools_IS_HOST_WINDOWS_RELEASE}"
                              qt_Qt6_UiTools_DEPS_TARGET
                              qt_Qt6_UiTools_LIBRARIES_TARGETS
                              "_RELEASE"
                              "qt_Qt6_UiTools"
                              "${qt_Qt6_UiTools_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET Qt6::UiTools
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_UiTools_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_UiTools_LIBRARIES_TARGETS}>
                     )

        if("${qt_Qt6_UiTools_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET Qt6::UiTools
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         qt_Qt6_UiTools_DEPS_TARGET)
        endif()

        set_property(TARGET Qt6::UiTools APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_UiTools_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET Qt6::UiTools APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_UiTools_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET Qt6::UiTools APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_UiTools_LIB_DIRS_RELEASE}>)
        set_property(TARGET Qt6::UiTools APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${qt_Qt6_UiTools_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET Qt6::UiTools APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_UiTools_COMPILE_OPTIONS_RELEASE}>)


    ########## COMPONENT Qt6::Help #############

        set(qt_Qt6_Help_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(qt_Qt6_Help_FRAMEWORKS_FOUND_RELEASE "${qt_Qt6_Help_FRAMEWORKS_RELEASE}" "${qt_Qt6_Help_FRAMEWORK_DIRS_RELEASE}")

        set(qt_Qt6_Help_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET qt_Qt6_Help_DEPS_TARGET)
            add_library(qt_Qt6_Help_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET qt_Qt6_Help_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_Help_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Help_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Help_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'qt_Qt6_Help_DEPS_TARGET' to all of them
        conan_package_library_targets("${qt_Qt6_Help_LIBS_RELEASE}"
                              "${qt_Qt6_Help_LIB_DIRS_RELEASE}"
                              "${qt_Qt6_Help_BIN_DIRS_RELEASE}" # package_bindir
                              "${qt_Qt6_Help_LIBRARY_TYPE_RELEASE}"
                              "${qt_Qt6_Help_IS_HOST_WINDOWS_RELEASE}"
                              qt_Qt6_Help_DEPS_TARGET
                              qt_Qt6_Help_LIBRARIES_TARGETS
                              "_RELEASE"
                              "qt_Qt6_Help"
                              "${qt_Qt6_Help_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET Qt6::Help
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_Help_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Help_LIBRARIES_TARGETS}>
                     )

        if("${qt_Qt6_Help_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET Qt6::Help
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         qt_Qt6_Help_DEPS_TARGET)
        endif()

        set_property(TARGET Qt6::Help APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Help_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET Qt6::Help APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_Help_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET Qt6::Help APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_Help_LIB_DIRS_RELEASE}>)
        set_property(TARGET Qt6::Help APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Help_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET Qt6::Help APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Help_COMPILE_OPTIONS_RELEASE}>)


    ########## COMPONENT Qt6::UiPlugin #############

        set(qt_Qt6_UiPlugin_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(qt_Qt6_UiPlugin_FRAMEWORKS_FOUND_RELEASE "${qt_Qt6_UiPlugin_FRAMEWORKS_RELEASE}" "${qt_Qt6_UiPlugin_FRAMEWORK_DIRS_RELEASE}")

        set(qt_Qt6_UiPlugin_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET qt_Qt6_UiPlugin_DEPS_TARGET)
            add_library(qt_Qt6_UiPlugin_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET qt_Qt6_UiPlugin_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_UiPlugin_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_UiPlugin_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_UiPlugin_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'qt_Qt6_UiPlugin_DEPS_TARGET' to all of them
        conan_package_library_targets("${qt_Qt6_UiPlugin_LIBS_RELEASE}"
                              "${qt_Qt6_UiPlugin_LIB_DIRS_RELEASE}"
                              "${qt_Qt6_UiPlugin_BIN_DIRS_RELEASE}" # package_bindir
                              "${qt_Qt6_UiPlugin_LIBRARY_TYPE_RELEASE}"
                              "${qt_Qt6_UiPlugin_IS_HOST_WINDOWS_RELEASE}"
                              qt_Qt6_UiPlugin_DEPS_TARGET
                              qt_Qt6_UiPlugin_LIBRARIES_TARGETS
                              "_RELEASE"
                              "qt_Qt6_UiPlugin"
                              "${qt_Qt6_UiPlugin_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET Qt6::UiPlugin
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_UiPlugin_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_UiPlugin_LIBRARIES_TARGETS}>
                     )

        if("${qt_Qt6_UiPlugin_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET Qt6::UiPlugin
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         qt_Qt6_UiPlugin_DEPS_TARGET)
        endif()

        set_property(TARGET Qt6::UiPlugin APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_UiPlugin_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET Qt6::UiPlugin APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_UiPlugin_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET Qt6::UiPlugin APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_UiPlugin_LIB_DIRS_RELEASE}>)
        set_property(TARGET Qt6::UiPlugin APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${qt_Qt6_UiPlugin_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET Qt6::UiPlugin APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_UiPlugin_COMPILE_OPTIONS_RELEASE}>)


    ########## COMPONENT Qt6::QmlWorkerScript #############

        set(qt_Qt6_QmlWorkerScript_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(qt_Qt6_QmlWorkerScript_FRAMEWORKS_FOUND_RELEASE "${qt_Qt6_QmlWorkerScript_FRAMEWORKS_RELEASE}" "${qt_Qt6_QmlWorkerScript_FRAMEWORK_DIRS_RELEASE}")

        set(qt_Qt6_QmlWorkerScript_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET qt_Qt6_QmlWorkerScript_DEPS_TARGET)
            add_library(qt_Qt6_QmlWorkerScript_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET qt_Qt6_QmlWorkerScript_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_QmlWorkerScript_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_QmlWorkerScript_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_QmlWorkerScript_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'qt_Qt6_QmlWorkerScript_DEPS_TARGET' to all of them
        conan_package_library_targets("${qt_Qt6_QmlWorkerScript_LIBS_RELEASE}"
                              "${qt_Qt6_QmlWorkerScript_LIB_DIRS_RELEASE}"
                              "${qt_Qt6_QmlWorkerScript_BIN_DIRS_RELEASE}" # package_bindir
                              "${qt_Qt6_QmlWorkerScript_LIBRARY_TYPE_RELEASE}"
                              "${qt_Qt6_QmlWorkerScript_IS_HOST_WINDOWS_RELEASE}"
                              qt_Qt6_QmlWorkerScript_DEPS_TARGET
                              qt_Qt6_QmlWorkerScript_LIBRARIES_TARGETS
                              "_RELEASE"
                              "qt_Qt6_QmlWorkerScript"
                              "${qt_Qt6_QmlWorkerScript_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET Qt6::QmlWorkerScript
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_QmlWorkerScript_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_QmlWorkerScript_LIBRARIES_TARGETS}>
                     )

        if("${qt_Qt6_QmlWorkerScript_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET Qt6::QmlWorkerScript
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         qt_Qt6_QmlWorkerScript_DEPS_TARGET)
        endif()

        set_property(TARGET Qt6::QmlWorkerScript APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_QmlWorkerScript_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET Qt6::QmlWorkerScript APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_QmlWorkerScript_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET Qt6::QmlWorkerScript APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_QmlWorkerScript_LIB_DIRS_RELEASE}>)
        set_property(TARGET Qt6::QmlWorkerScript APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${qt_Qt6_QmlWorkerScript_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET Qt6::QmlWorkerScript APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_QmlWorkerScript_COMPILE_OPTIONS_RELEASE}>)


    ########## COMPONENT Qt6::QmlImportScanner #############

        set(qt_Qt6_QmlImportScanner_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(qt_Qt6_QmlImportScanner_FRAMEWORKS_FOUND_RELEASE "${qt_Qt6_QmlImportScanner_FRAMEWORKS_RELEASE}" "${qt_Qt6_QmlImportScanner_FRAMEWORK_DIRS_RELEASE}")

        set(qt_Qt6_QmlImportScanner_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET qt_Qt6_QmlImportScanner_DEPS_TARGET)
            add_library(qt_Qt6_QmlImportScanner_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET qt_Qt6_QmlImportScanner_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_QmlImportScanner_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_QmlImportScanner_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_QmlImportScanner_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'qt_Qt6_QmlImportScanner_DEPS_TARGET' to all of them
        conan_package_library_targets("${qt_Qt6_QmlImportScanner_LIBS_RELEASE}"
                              "${qt_Qt6_QmlImportScanner_LIB_DIRS_RELEASE}"
                              "${qt_Qt6_QmlImportScanner_BIN_DIRS_RELEASE}" # package_bindir
                              "${qt_Qt6_QmlImportScanner_LIBRARY_TYPE_RELEASE}"
                              "${qt_Qt6_QmlImportScanner_IS_HOST_WINDOWS_RELEASE}"
                              qt_Qt6_QmlImportScanner_DEPS_TARGET
                              qt_Qt6_QmlImportScanner_LIBRARIES_TARGETS
                              "_RELEASE"
                              "qt_Qt6_QmlImportScanner"
                              "${qt_Qt6_QmlImportScanner_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET Qt6::QmlImportScanner
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_QmlImportScanner_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_QmlImportScanner_LIBRARIES_TARGETS}>
                     )

        if("${qt_Qt6_QmlImportScanner_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET Qt6::QmlImportScanner
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         qt_Qt6_QmlImportScanner_DEPS_TARGET)
        endif()

        set_property(TARGET Qt6::QmlImportScanner APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_QmlImportScanner_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET Qt6::QmlImportScanner APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_QmlImportScanner_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET Qt6::QmlImportScanner APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_QmlImportScanner_LIB_DIRS_RELEASE}>)
        set_property(TARGET Qt6::QmlImportScanner APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${qt_Qt6_QmlImportScanner_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET Qt6::QmlImportScanner APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_QmlImportScanner_COMPILE_OPTIONS_RELEASE}>)


    ########## COMPONENT Qt6::QmlModels #############

        set(qt_Qt6_QmlModels_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(qt_Qt6_QmlModels_FRAMEWORKS_FOUND_RELEASE "${qt_Qt6_QmlModels_FRAMEWORKS_RELEASE}" "${qt_Qt6_QmlModels_FRAMEWORK_DIRS_RELEASE}")

        set(qt_Qt6_QmlModels_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET qt_Qt6_QmlModels_DEPS_TARGET)
            add_library(qt_Qt6_QmlModels_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET qt_Qt6_QmlModels_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_QmlModels_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_QmlModels_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_QmlModels_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'qt_Qt6_QmlModels_DEPS_TARGET' to all of them
        conan_package_library_targets("${qt_Qt6_QmlModels_LIBS_RELEASE}"
                              "${qt_Qt6_QmlModels_LIB_DIRS_RELEASE}"
                              "${qt_Qt6_QmlModels_BIN_DIRS_RELEASE}" # package_bindir
                              "${qt_Qt6_QmlModels_LIBRARY_TYPE_RELEASE}"
                              "${qt_Qt6_QmlModels_IS_HOST_WINDOWS_RELEASE}"
                              qt_Qt6_QmlModels_DEPS_TARGET
                              qt_Qt6_QmlModels_LIBRARIES_TARGETS
                              "_RELEASE"
                              "qt_Qt6_QmlModels"
                              "${qt_Qt6_QmlModels_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET Qt6::QmlModels
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_QmlModels_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_QmlModels_LIBRARIES_TARGETS}>
                     )

        if("${qt_Qt6_QmlModels_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET Qt6::QmlModels
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         qt_Qt6_QmlModels_DEPS_TARGET)
        endif()

        set_property(TARGET Qt6::QmlModels APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_QmlModels_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET Qt6::QmlModels APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_QmlModels_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET Qt6::QmlModels APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_QmlModels_LIB_DIRS_RELEASE}>)
        set_property(TARGET Qt6::QmlModels APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${qt_Qt6_QmlModels_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET Qt6::QmlModels APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_QmlModels_COMPILE_OPTIONS_RELEASE}>)


    ########## COMPONENT Qt6::OpenGLWidgets #############

        set(qt_Qt6_OpenGLWidgets_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(qt_Qt6_OpenGLWidgets_FRAMEWORKS_FOUND_RELEASE "${qt_Qt6_OpenGLWidgets_FRAMEWORKS_RELEASE}" "${qt_Qt6_OpenGLWidgets_FRAMEWORK_DIRS_RELEASE}")

        set(qt_Qt6_OpenGLWidgets_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET qt_Qt6_OpenGLWidgets_DEPS_TARGET)
            add_library(qt_Qt6_OpenGLWidgets_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET qt_Qt6_OpenGLWidgets_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_OpenGLWidgets_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_OpenGLWidgets_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_OpenGLWidgets_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'qt_Qt6_OpenGLWidgets_DEPS_TARGET' to all of them
        conan_package_library_targets("${qt_Qt6_OpenGLWidgets_LIBS_RELEASE}"
                              "${qt_Qt6_OpenGLWidgets_LIB_DIRS_RELEASE}"
                              "${qt_Qt6_OpenGLWidgets_BIN_DIRS_RELEASE}" # package_bindir
                              "${qt_Qt6_OpenGLWidgets_LIBRARY_TYPE_RELEASE}"
                              "${qt_Qt6_OpenGLWidgets_IS_HOST_WINDOWS_RELEASE}"
                              qt_Qt6_OpenGLWidgets_DEPS_TARGET
                              qt_Qt6_OpenGLWidgets_LIBRARIES_TARGETS
                              "_RELEASE"
                              "qt_Qt6_OpenGLWidgets"
                              "${qt_Qt6_OpenGLWidgets_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET Qt6::OpenGLWidgets
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_OpenGLWidgets_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_OpenGLWidgets_LIBRARIES_TARGETS}>
                     )

        if("${qt_Qt6_OpenGLWidgets_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET Qt6::OpenGLWidgets
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         qt_Qt6_OpenGLWidgets_DEPS_TARGET)
        endif()

        set_property(TARGET Qt6::OpenGLWidgets APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_OpenGLWidgets_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET Qt6::OpenGLWidgets APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_OpenGLWidgets_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET Qt6::OpenGLWidgets APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_OpenGLWidgets_LIB_DIRS_RELEASE}>)
        set_property(TARGET Qt6::OpenGLWidgets APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${qt_Qt6_OpenGLWidgets_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET Qt6::OpenGLWidgets APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_OpenGLWidgets_COMPILE_OPTIONS_RELEASE}>)


    ########## COMPONENT Qt6::PrintSupport #############

        set(qt_Qt6_PrintSupport_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(qt_Qt6_PrintSupport_FRAMEWORKS_FOUND_RELEASE "${qt_Qt6_PrintSupport_FRAMEWORKS_RELEASE}" "${qt_Qt6_PrintSupport_FRAMEWORK_DIRS_RELEASE}")

        set(qt_Qt6_PrintSupport_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET qt_Qt6_PrintSupport_DEPS_TARGET)
            add_library(qt_Qt6_PrintSupport_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET qt_Qt6_PrintSupport_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_PrintSupport_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_PrintSupport_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_PrintSupport_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'qt_Qt6_PrintSupport_DEPS_TARGET' to all of them
        conan_package_library_targets("${qt_Qt6_PrintSupport_LIBS_RELEASE}"
                              "${qt_Qt6_PrintSupport_LIB_DIRS_RELEASE}"
                              "${qt_Qt6_PrintSupport_BIN_DIRS_RELEASE}" # package_bindir
                              "${qt_Qt6_PrintSupport_LIBRARY_TYPE_RELEASE}"
                              "${qt_Qt6_PrintSupport_IS_HOST_WINDOWS_RELEASE}"
                              qt_Qt6_PrintSupport_DEPS_TARGET
                              qt_Qt6_PrintSupport_LIBRARIES_TARGETS
                              "_RELEASE"
                              "qt_Qt6_PrintSupport"
                              "${qt_Qt6_PrintSupport_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET Qt6::PrintSupport
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_PrintSupport_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_PrintSupport_LIBRARIES_TARGETS}>
                     )

        if("${qt_Qt6_PrintSupport_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET Qt6::PrintSupport
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         qt_Qt6_PrintSupport_DEPS_TARGET)
        endif()

        set_property(TARGET Qt6::PrintSupport APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_PrintSupport_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET Qt6::PrintSupport APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_PrintSupport_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET Qt6::PrintSupport APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_PrintSupport_LIB_DIRS_RELEASE}>)
        set_property(TARGET Qt6::PrintSupport APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${qt_Qt6_PrintSupport_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET Qt6::PrintSupport APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_PrintSupport_COMPILE_OPTIONS_RELEASE}>)


    ########## COMPONENT Qt6::Qml #############

        set(qt_Qt6_Qml_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(qt_Qt6_Qml_FRAMEWORKS_FOUND_RELEASE "${qt_Qt6_Qml_FRAMEWORKS_RELEASE}" "${qt_Qt6_Qml_FRAMEWORK_DIRS_RELEASE}")

        set(qt_Qt6_Qml_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET qt_Qt6_Qml_DEPS_TARGET)
            add_library(qt_Qt6_Qml_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET qt_Qt6_Qml_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_Qml_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Qml_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Qml_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'qt_Qt6_Qml_DEPS_TARGET' to all of them
        conan_package_library_targets("${qt_Qt6_Qml_LIBS_RELEASE}"
                              "${qt_Qt6_Qml_LIB_DIRS_RELEASE}"
                              "${qt_Qt6_Qml_BIN_DIRS_RELEASE}" # package_bindir
                              "${qt_Qt6_Qml_LIBRARY_TYPE_RELEASE}"
                              "${qt_Qt6_Qml_IS_HOST_WINDOWS_RELEASE}"
                              qt_Qt6_Qml_DEPS_TARGET
                              qt_Qt6_Qml_LIBRARIES_TARGETS
                              "_RELEASE"
                              "qt_Qt6_Qml"
                              "${qt_Qt6_Qml_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET Qt6::Qml
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_Qml_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Qml_LIBRARIES_TARGETS}>
                     )

        if("${qt_Qt6_Qml_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET Qt6::Qml
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         qt_Qt6_Qml_DEPS_TARGET)
        endif()

        set_property(TARGET Qt6::Qml APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Qml_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET Qt6::Qml APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_Qml_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET Qt6::Qml APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_Qml_LIB_DIRS_RELEASE}>)
        set_property(TARGET Qt6::Qml APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Qml_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET Qt6::Qml APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Qml_COMPILE_OPTIONS_RELEASE}>)


    ########## COMPONENT Qt6::OpenGL #############

        set(qt_Qt6_OpenGL_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(qt_Qt6_OpenGL_FRAMEWORKS_FOUND_RELEASE "${qt_Qt6_OpenGL_FRAMEWORKS_RELEASE}" "${qt_Qt6_OpenGL_FRAMEWORK_DIRS_RELEASE}")

        set(qt_Qt6_OpenGL_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET qt_Qt6_OpenGL_DEPS_TARGET)
            add_library(qt_Qt6_OpenGL_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET qt_Qt6_OpenGL_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_OpenGL_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_OpenGL_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_OpenGL_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'qt_Qt6_OpenGL_DEPS_TARGET' to all of them
        conan_package_library_targets("${qt_Qt6_OpenGL_LIBS_RELEASE}"
                              "${qt_Qt6_OpenGL_LIB_DIRS_RELEASE}"
                              "${qt_Qt6_OpenGL_BIN_DIRS_RELEASE}" # package_bindir
                              "${qt_Qt6_OpenGL_LIBRARY_TYPE_RELEASE}"
                              "${qt_Qt6_OpenGL_IS_HOST_WINDOWS_RELEASE}"
                              qt_Qt6_OpenGL_DEPS_TARGET
                              qt_Qt6_OpenGL_LIBRARIES_TARGETS
                              "_RELEASE"
                              "qt_Qt6_OpenGL"
                              "${qt_Qt6_OpenGL_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET Qt6::OpenGL
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_OpenGL_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_OpenGL_LIBRARIES_TARGETS}>
                     )

        if("${qt_Qt6_OpenGL_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET Qt6::OpenGL
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         qt_Qt6_OpenGL_DEPS_TARGET)
        endif()

        set_property(TARGET Qt6::OpenGL APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_OpenGL_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET Qt6::OpenGL APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_OpenGL_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET Qt6::OpenGL APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_OpenGL_LIB_DIRS_RELEASE}>)
        set_property(TARGET Qt6::OpenGL APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${qt_Qt6_OpenGL_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET Qt6::OpenGL APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_OpenGL_COMPILE_OPTIONS_RELEASE}>)


    ########## COMPONENT Qt6::Widgets #############

        set(qt_Qt6_Widgets_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(qt_Qt6_Widgets_FRAMEWORKS_FOUND_RELEASE "${qt_Qt6_Widgets_FRAMEWORKS_RELEASE}" "${qt_Qt6_Widgets_FRAMEWORK_DIRS_RELEASE}")

        set(qt_Qt6_Widgets_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET qt_Qt6_Widgets_DEPS_TARGET)
            add_library(qt_Qt6_Widgets_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET qt_Qt6_Widgets_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_Widgets_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Widgets_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Widgets_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'qt_Qt6_Widgets_DEPS_TARGET' to all of them
        conan_package_library_targets("${qt_Qt6_Widgets_LIBS_RELEASE}"
                              "${qt_Qt6_Widgets_LIB_DIRS_RELEASE}"
                              "${qt_Qt6_Widgets_BIN_DIRS_RELEASE}" # package_bindir
                              "${qt_Qt6_Widgets_LIBRARY_TYPE_RELEASE}"
                              "${qt_Qt6_Widgets_IS_HOST_WINDOWS_RELEASE}"
                              qt_Qt6_Widgets_DEPS_TARGET
                              qt_Qt6_Widgets_LIBRARIES_TARGETS
                              "_RELEASE"
                              "qt_Qt6_Widgets"
                              "${qt_Qt6_Widgets_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET Qt6::Widgets
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_Widgets_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Widgets_LIBRARIES_TARGETS}>
                     )

        if("${qt_Qt6_Widgets_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET Qt6::Widgets
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         qt_Qt6_Widgets_DEPS_TARGET)
        endif()

        set_property(TARGET Qt6::Widgets APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Widgets_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET Qt6::Widgets APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_Widgets_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET Qt6::Widgets APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_Widgets_LIB_DIRS_RELEASE}>)
        set_property(TARGET Qt6::Widgets APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Widgets_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET Qt6::Widgets APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Widgets_COMPILE_OPTIONS_RELEASE}>)


    ########## COMPONENT Qt6::QIcoPlugin #############

        set(qt_Qt6_QIcoPlugin_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(qt_Qt6_QIcoPlugin_FRAMEWORKS_FOUND_RELEASE "${qt_Qt6_QIcoPlugin_FRAMEWORKS_RELEASE}" "${qt_Qt6_QIcoPlugin_FRAMEWORK_DIRS_RELEASE}")

        set(qt_Qt6_QIcoPlugin_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET qt_Qt6_QIcoPlugin_DEPS_TARGET)
            add_library(qt_Qt6_QIcoPlugin_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET qt_Qt6_QIcoPlugin_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_QIcoPlugin_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_QIcoPlugin_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_QIcoPlugin_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'qt_Qt6_QIcoPlugin_DEPS_TARGET' to all of them
        conan_package_library_targets("${qt_Qt6_QIcoPlugin_LIBS_RELEASE}"
                              "${qt_Qt6_QIcoPlugin_LIB_DIRS_RELEASE}"
                              "${qt_Qt6_QIcoPlugin_BIN_DIRS_RELEASE}" # package_bindir
                              "${qt_Qt6_QIcoPlugin_LIBRARY_TYPE_RELEASE}"
                              "${qt_Qt6_QIcoPlugin_IS_HOST_WINDOWS_RELEASE}"
                              qt_Qt6_QIcoPlugin_DEPS_TARGET
                              qt_Qt6_QIcoPlugin_LIBRARIES_TARGETS
                              "_RELEASE"
                              "qt_Qt6_QIcoPlugin"
                              "${qt_Qt6_QIcoPlugin_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET Qt6::QIcoPlugin
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_QIcoPlugin_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_QIcoPlugin_LIBRARIES_TARGETS}>
                     )

        if("${qt_Qt6_QIcoPlugin_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET Qt6::QIcoPlugin
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         qt_Qt6_QIcoPlugin_DEPS_TARGET)
        endif()

        set_property(TARGET Qt6::QIcoPlugin APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_QIcoPlugin_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET Qt6::QIcoPlugin APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_QIcoPlugin_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET Qt6::QIcoPlugin APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_QIcoPlugin_LIB_DIRS_RELEASE}>)
        set_property(TARGET Qt6::QIcoPlugin APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${qt_Qt6_QIcoPlugin_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET Qt6::QIcoPlugin APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_QIcoPlugin_COMPILE_OPTIONS_RELEASE}>)


    ########## COMPONENT Qt6::QGifPlugin #############

        set(qt_Qt6_QGifPlugin_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(qt_Qt6_QGifPlugin_FRAMEWORKS_FOUND_RELEASE "${qt_Qt6_QGifPlugin_FRAMEWORKS_RELEASE}" "${qt_Qt6_QGifPlugin_FRAMEWORK_DIRS_RELEASE}")

        set(qt_Qt6_QGifPlugin_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET qt_Qt6_QGifPlugin_DEPS_TARGET)
            add_library(qt_Qt6_QGifPlugin_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET qt_Qt6_QGifPlugin_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_QGifPlugin_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_QGifPlugin_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_QGifPlugin_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'qt_Qt6_QGifPlugin_DEPS_TARGET' to all of them
        conan_package_library_targets("${qt_Qt6_QGifPlugin_LIBS_RELEASE}"
                              "${qt_Qt6_QGifPlugin_LIB_DIRS_RELEASE}"
                              "${qt_Qt6_QGifPlugin_BIN_DIRS_RELEASE}" # package_bindir
                              "${qt_Qt6_QGifPlugin_LIBRARY_TYPE_RELEASE}"
                              "${qt_Qt6_QGifPlugin_IS_HOST_WINDOWS_RELEASE}"
                              qt_Qt6_QGifPlugin_DEPS_TARGET
                              qt_Qt6_QGifPlugin_LIBRARIES_TARGETS
                              "_RELEASE"
                              "qt_Qt6_QGifPlugin"
                              "${qt_Qt6_QGifPlugin_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET Qt6::QGifPlugin
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_QGifPlugin_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_QGifPlugin_LIBRARIES_TARGETS}>
                     )

        if("${qt_Qt6_QGifPlugin_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET Qt6::QGifPlugin
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         qt_Qt6_QGifPlugin_DEPS_TARGET)
        endif()

        set_property(TARGET Qt6::QGifPlugin APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_QGifPlugin_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET Qt6::QGifPlugin APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_QGifPlugin_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET Qt6::QGifPlugin APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_QGifPlugin_LIB_DIRS_RELEASE}>)
        set_property(TARGET Qt6::QGifPlugin APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${qt_Qt6_QGifPlugin_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET Qt6::QGifPlugin APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_QGifPlugin_COMPILE_OPTIONS_RELEASE}>)


    ########## COMPONENT Qt6::QCocoaIntegrationPlugin #############

        set(qt_Qt6_QCocoaIntegrationPlugin_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(qt_Qt6_QCocoaIntegrationPlugin_FRAMEWORKS_FOUND_RELEASE "${qt_Qt6_QCocoaIntegrationPlugin_FRAMEWORKS_RELEASE}" "${qt_Qt6_QCocoaIntegrationPlugin_FRAMEWORK_DIRS_RELEASE}")

        set(qt_Qt6_QCocoaIntegrationPlugin_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET qt_Qt6_QCocoaIntegrationPlugin_DEPS_TARGET)
            add_library(qt_Qt6_QCocoaIntegrationPlugin_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET qt_Qt6_QCocoaIntegrationPlugin_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_QCocoaIntegrationPlugin_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_QCocoaIntegrationPlugin_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_QCocoaIntegrationPlugin_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'qt_Qt6_QCocoaIntegrationPlugin_DEPS_TARGET' to all of them
        conan_package_library_targets("${qt_Qt6_QCocoaIntegrationPlugin_LIBS_RELEASE}"
                              "${qt_Qt6_QCocoaIntegrationPlugin_LIB_DIRS_RELEASE}"
                              "${qt_Qt6_QCocoaIntegrationPlugin_BIN_DIRS_RELEASE}" # package_bindir
                              "${qt_Qt6_QCocoaIntegrationPlugin_LIBRARY_TYPE_RELEASE}"
                              "${qt_Qt6_QCocoaIntegrationPlugin_IS_HOST_WINDOWS_RELEASE}"
                              qt_Qt6_QCocoaIntegrationPlugin_DEPS_TARGET
                              qt_Qt6_QCocoaIntegrationPlugin_LIBRARIES_TARGETS
                              "_RELEASE"
                              "qt_Qt6_QCocoaIntegrationPlugin"
                              "${qt_Qt6_QCocoaIntegrationPlugin_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET Qt6::QCocoaIntegrationPlugin
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_QCocoaIntegrationPlugin_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_QCocoaIntegrationPlugin_LIBRARIES_TARGETS}>
                     )

        if("${qt_Qt6_QCocoaIntegrationPlugin_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET Qt6::QCocoaIntegrationPlugin
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         qt_Qt6_QCocoaIntegrationPlugin_DEPS_TARGET)
        endif()

        set_property(TARGET Qt6::QCocoaIntegrationPlugin APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_QCocoaIntegrationPlugin_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET Qt6::QCocoaIntegrationPlugin APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_QCocoaIntegrationPlugin_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET Qt6::QCocoaIntegrationPlugin APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_QCocoaIntegrationPlugin_LIB_DIRS_RELEASE}>)
        set_property(TARGET Qt6::QCocoaIntegrationPlugin APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${qt_Qt6_QCocoaIntegrationPlugin_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET Qt6::QCocoaIntegrationPlugin APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_QCocoaIntegrationPlugin_COMPILE_OPTIONS_RELEASE}>)


    ########## COMPONENT Qt6::Xml #############

        set(qt_Qt6_Xml_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(qt_Qt6_Xml_FRAMEWORKS_FOUND_RELEASE "${qt_Qt6_Xml_FRAMEWORKS_RELEASE}" "${qt_Qt6_Xml_FRAMEWORK_DIRS_RELEASE}")

        set(qt_Qt6_Xml_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET qt_Qt6_Xml_DEPS_TARGET)
            add_library(qt_Qt6_Xml_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET qt_Qt6_Xml_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_Xml_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Xml_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Xml_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'qt_Qt6_Xml_DEPS_TARGET' to all of them
        conan_package_library_targets("${qt_Qt6_Xml_LIBS_RELEASE}"
                              "${qt_Qt6_Xml_LIB_DIRS_RELEASE}"
                              "${qt_Qt6_Xml_BIN_DIRS_RELEASE}" # package_bindir
                              "${qt_Qt6_Xml_LIBRARY_TYPE_RELEASE}"
                              "${qt_Qt6_Xml_IS_HOST_WINDOWS_RELEASE}"
                              qt_Qt6_Xml_DEPS_TARGET
                              qt_Qt6_Xml_LIBRARIES_TARGETS
                              "_RELEASE"
                              "qt_Qt6_Xml"
                              "${qt_Qt6_Xml_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET Qt6::Xml
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_Xml_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Xml_LIBRARIES_TARGETS}>
                     )

        if("${qt_Qt6_Xml_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET Qt6::Xml
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         qt_Qt6_Xml_DEPS_TARGET)
        endif()

        set_property(TARGET Qt6::Xml APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Xml_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET Qt6::Xml APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_Xml_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET Qt6::Xml APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_Xml_LIB_DIRS_RELEASE}>)
        set_property(TARGET Qt6::Xml APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Xml_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET Qt6::Xml APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Xml_COMPILE_OPTIONS_RELEASE}>)


    ########## COMPONENT Qt6::Concurrent #############

        set(qt_Qt6_Concurrent_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(qt_Qt6_Concurrent_FRAMEWORKS_FOUND_RELEASE "${qt_Qt6_Concurrent_FRAMEWORKS_RELEASE}" "${qt_Qt6_Concurrent_FRAMEWORK_DIRS_RELEASE}")

        set(qt_Qt6_Concurrent_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET qt_Qt6_Concurrent_DEPS_TARGET)
            add_library(qt_Qt6_Concurrent_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET qt_Qt6_Concurrent_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_Concurrent_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Concurrent_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Concurrent_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'qt_Qt6_Concurrent_DEPS_TARGET' to all of them
        conan_package_library_targets("${qt_Qt6_Concurrent_LIBS_RELEASE}"
                              "${qt_Qt6_Concurrent_LIB_DIRS_RELEASE}"
                              "${qt_Qt6_Concurrent_BIN_DIRS_RELEASE}" # package_bindir
                              "${qt_Qt6_Concurrent_LIBRARY_TYPE_RELEASE}"
                              "${qt_Qt6_Concurrent_IS_HOST_WINDOWS_RELEASE}"
                              qt_Qt6_Concurrent_DEPS_TARGET
                              qt_Qt6_Concurrent_LIBRARIES_TARGETS
                              "_RELEASE"
                              "qt_Qt6_Concurrent"
                              "${qt_Qt6_Concurrent_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET Qt6::Concurrent
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_Concurrent_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Concurrent_LIBRARIES_TARGETS}>
                     )

        if("${qt_Qt6_Concurrent_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET Qt6::Concurrent
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         qt_Qt6_Concurrent_DEPS_TARGET)
        endif()

        set_property(TARGET Qt6::Concurrent APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Concurrent_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET Qt6::Concurrent APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_Concurrent_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET Qt6::Concurrent APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_Concurrent_LIB_DIRS_RELEASE}>)
        set_property(TARGET Qt6::Concurrent APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Concurrent_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET Qt6::Concurrent APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Concurrent_COMPILE_OPTIONS_RELEASE}>)


    ########## COMPONENT Qt6::Test #############

        set(qt_Qt6_Test_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(qt_Qt6_Test_FRAMEWORKS_FOUND_RELEASE "${qt_Qt6_Test_FRAMEWORKS_RELEASE}" "${qt_Qt6_Test_FRAMEWORK_DIRS_RELEASE}")

        set(qt_Qt6_Test_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET qt_Qt6_Test_DEPS_TARGET)
            add_library(qt_Qt6_Test_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET qt_Qt6_Test_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_Test_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Test_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Test_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'qt_Qt6_Test_DEPS_TARGET' to all of them
        conan_package_library_targets("${qt_Qt6_Test_LIBS_RELEASE}"
                              "${qt_Qt6_Test_LIB_DIRS_RELEASE}"
                              "${qt_Qt6_Test_BIN_DIRS_RELEASE}" # package_bindir
                              "${qt_Qt6_Test_LIBRARY_TYPE_RELEASE}"
                              "${qt_Qt6_Test_IS_HOST_WINDOWS_RELEASE}"
                              qt_Qt6_Test_DEPS_TARGET
                              qt_Qt6_Test_LIBRARIES_TARGETS
                              "_RELEASE"
                              "qt_Qt6_Test"
                              "${qt_Qt6_Test_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET Qt6::Test
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_Test_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Test_LIBRARIES_TARGETS}>
                     )

        if("${qt_Qt6_Test_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET Qt6::Test
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         qt_Qt6_Test_DEPS_TARGET)
        endif()

        set_property(TARGET Qt6::Test APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Test_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET Qt6::Test APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_Test_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET Qt6::Test APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_Test_LIB_DIRS_RELEASE}>)
        set_property(TARGET Qt6::Test APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Test_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET Qt6::Test APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Test_COMPILE_OPTIONS_RELEASE}>)


    ########## COMPONENT Qt6::Sql #############

        set(qt_Qt6_Sql_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(qt_Qt6_Sql_FRAMEWORKS_FOUND_RELEASE "${qt_Qt6_Sql_FRAMEWORKS_RELEASE}" "${qt_Qt6_Sql_FRAMEWORK_DIRS_RELEASE}")

        set(qt_Qt6_Sql_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET qt_Qt6_Sql_DEPS_TARGET)
            add_library(qt_Qt6_Sql_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET qt_Qt6_Sql_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_Sql_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Sql_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Sql_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'qt_Qt6_Sql_DEPS_TARGET' to all of them
        conan_package_library_targets("${qt_Qt6_Sql_LIBS_RELEASE}"
                              "${qt_Qt6_Sql_LIB_DIRS_RELEASE}"
                              "${qt_Qt6_Sql_BIN_DIRS_RELEASE}" # package_bindir
                              "${qt_Qt6_Sql_LIBRARY_TYPE_RELEASE}"
                              "${qt_Qt6_Sql_IS_HOST_WINDOWS_RELEASE}"
                              qt_Qt6_Sql_DEPS_TARGET
                              qt_Qt6_Sql_LIBRARIES_TARGETS
                              "_RELEASE"
                              "qt_Qt6_Sql"
                              "${qt_Qt6_Sql_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET Qt6::Sql
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_Sql_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Sql_LIBRARIES_TARGETS}>
                     )

        if("${qt_Qt6_Sql_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET Qt6::Sql
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         qt_Qt6_Sql_DEPS_TARGET)
        endif()

        set_property(TARGET Qt6::Sql APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Sql_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET Qt6::Sql APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_Sql_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET Qt6::Sql APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_Sql_LIB_DIRS_RELEASE}>)
        set_property(TARGET Qt6::Sql APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Sql_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET Qt6::Sql APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Sql_COMPILE_OPTIONS_RELEASE}>)


    ########## COMPONENT Qt6::Network #############

        set(qt_Qt6_Network_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(qt_Qt6_Network_FRAMEWORKS_FOUND_RELEASE "${qt_Qt6_Network_FRAMEWORKS_RELEASE}" "${qt_Qt6_Network_FRAMEWORK_DIRS_RELEASE}")

        set(qt_Qt6_Network_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET qt_Qt6_Network_DEPS_TARGET)
            add_library(qt_Qt6_Network_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET qt_Qt6_Network_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_Network_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Network_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Network_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'qt_Qt6_Network_DEPS_TARGET' to all of them
        conan_package_library_targets("${qt_Qt6_Network_LIBS_RELEASE}"
                              "${qt_Qt6_Network_LIB_DIRS_RELEASE}"
                              "${qt_Qt6_Network_BIN_DIRS_RELEASE}" # package_bindir
                              "${qt_Qt6_Network_LIBRARY_TYPE_RELEASE}"
                              "${qt_Qt6_Network_IS_HOST_WINDOWS_RELEASE}"
                              qt_Qt6_Network_DEPS_TARGET
                              qt_Qt6_Network_LIBRARIES_TARGETS
                              "_RELEASE"
                              "qt_Qt6_Network"
                              "${qt_Qt6_Network_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET Qt6::Network
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_Network_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Network_LIBRARIES_TARGETS}>
                     )

        if("${qt_Qt6_Network_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET Qt6::Network
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         qt_Qt6_Network_DEPS_TARGET)
        endif()

        set_property(TARGET Qt6::Network APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Network_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET Qt6::Network APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_Network_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET Qt6::Network APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_Network_LIB_DIRS_RELEASE}>)
        set_property(TARGET Qt6::Network APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Network_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET Qt6::Network APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Network_COMPILE_OPTIONS_RELEASE}>)


    ########## COMPONENT Qt6::Gui #############

        set(qt_Qt6_Gui_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(qt_Qt6_Gui_FRAMEWORKS_FOUND_RELEASE "${qt_Qt6_Gui_FRAMEWORKS_RELEASE}" "${qt_Qt6_Gui_FRAMEWORK_DIRS_RELEASE}")

        set(qt_Qt6_Gui_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET qt_Qt6_Gui_DEPS_TARGET)
            add_library(qt_Qt6_Gui_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET qt_Qt6_Gui_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_Gui_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Gui_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Gui_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'qt_Qt6_Gui_DEPS_TARGET' to all of them
        conan_package_library_targets("${qt_Qt6_Gui_LIBS_RELEASE}"
                              "${qt_Qt6_Gui_LIB_DIRS_RELEASE}"
                              "${qt_Qt6_Gui_BIN_DIRS_RELEASE}" # package_bindir
                              "${qt_Qt6_Gui_LIBRARY_TYPE_RELEASE}"
                              "${qt_Qt6_Gui_IS_HOST_WINDOWS_RELEASE}"
                              qt_Qt6_Gui_DEPS_TARGET
                              qt_Qt6_Gui_LIBRARIES_TARGETS
                              "_RELEASE"
                              "qt_Qt6_Gui"
                              "${qt_Qt6_Gui_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET Qt6::Gui
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_Gui_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Gui_LIBRARIES_TARGETS}>
                     )

        if("${qt_Qt6_Gui_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET Qt6::Gui
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         qt_Qt6_Gui_DEPS_TARGET)
        endif()

        set_property(TARGET Qt6::Gui APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Gui_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET Qt6::Gui APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_Gui_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET Qt6::Gui APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_Gui_LIB_DIRS_RELEASE}>)
        set_property(TARGET Qt6::Gui APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Gui_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET Qt6::Gui APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Gui_COMPILE_OPTIONS_RELEASE}>)


    ########## COMPONENT Qt6::LinguistTools #############

        set(qt_Qt6_LinguistTools_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(qt_Qt6_LinguistTools_FRAMEWORKS_FOUND_RELEASE "${qt_Qt6_LinguistTools_FRAMEWORKS_RELEASE}" "${qt_Qt6_LinguistTools_FRAMEWORK_DIRS_RELEASE}")

        set(qt_Qt6_LinguistTools_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET qt_Qt6_LinguistTools_DEPS_TARGET)
            add_library(qt_Qt6_LinguistTools_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET qt_Qt6_LinguistTools_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_LinguistTools_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_LinguistTools_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_LinguistTools_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'qt_Qt6_LinguistTools_DEPS_TARGET' to all of them
        conan_package_library_targets("${qt_Qt6_LinguistTools_LIBS_RELEASE}"
                              "${qt_Qt6_LinguistTools_LIB_DIRS_RELEASE}"
                              "${qt_Qt6_LinguistTools_BIN_DIRS_RELEASE}" # package_bindir
                              "${qt_Qt6_LinguistTools_LIBRARY_TYPE_RELEASE}"
                              "${qt_Qt6_LinguistTools_IS_HOST_WINDOWS_RELEASE}"
                              qt_Qt6_LinguistTools_DEPS_TARGET
                              qt_Qt6_LinguistTools_LIBRARIES_TARGETS
                              "_RELEASE"
                              "qt_Qt6_LinguistTools"
                              "${qt_Qt6_LinguistTools_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET Qt6::LinguistTools
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_LinguistTools_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_LinguistTools_LIBRARIES_TARGETS}>
                     )

        if("${qt_Qt6_LinguistTools_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET Qt6::LinguistTools
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         qt_Qt6_LinguistTools_DEPS_TARGET)
        endif()

        set_property(TARGET Qt6::LinguistTools APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_LinguistTools_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET Qt6::LinguistTools APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_LinguistTools_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET Qt6::LinguistTools APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_LinguistTools_LIB_DIRS_RELEASE}>)
        set_property(TARGET Qt6::LinguistTools APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${qt_Qt6_LinguistTools_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET Qt6::LinguistTools APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_LinguistTools_COMPILE_OPTIONS_RELEASE}>)


    ########## COMPONENT qt::QCocoaIntegrationPlugin #############

        set(qt_qt_QCocoaIntegrationPlugin_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(qt_qt_QCocoaIntegrationPlugin_FRAMEWORKS_FOUND_RELEASE "${qt_qt_QCocoaIntegrationPlugin_FRAMEWORKS_RELEASE}" "${qt_qt_QCocoaIntegrationPlugin_FRAMEWORK_DIRS_RELEASE}")

        set(qt_qt_QCocoaIntegrationPlugin_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET qt_qt_QCocoaIntegrationPlugin_DEPS_TARGET)
            add_library(qt_qt_QCocoaIntegrationPlugin_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET qt_qt_QCocoaIntegrationPlugin_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_qt_QCocoaIntegrationPlugin_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${qt_qt_QCocoaIntegrationPlugin_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_qt_QCocoaIntegrationPlugin_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'qt_qt_QCocoaIntegrationPlugin_DEPS_TARGET' to all of them
        conan_package_library_targets("${qt_qt_QCocoaIntegrationPlugin_LIBS_RELEASE}"
                              "${qt_qt_QCocoaIntegrationPlugin_LIB_DIRS_RELEASE}"
                              "${qt_qt_QCocoaIntegrationPlugin_BIN_DIRS_RELEASE}" # package_bindir
                              "${qt_qt_QCocoaIntegrationPlugin_LIBRARY_TYPE_RELEASE}"
                              "${qt_qt_QCocoaIntegrationPlugin_IS_HOST_WINDOWS_RELEASE}"
                              qt_qt_QCocoaIntegrationPlugin_DEPS_TARGET
                              qt_qt_QCocoaIntegrationPlugin_LIBRARIES_TARGETS
                              "_RELEASE"
                              "qt_qt_QCocoaIntegrationPlugin"
                              "${qt_qt_QCocoaIntegrationPlugin_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET qt::QCocoaIntegrationPlugin
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_qt_QCocoaIntegrationPlugin_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_qt_QCocoaIntegrationPlugin_LIBRARIES_TARGETS}>
                     )

        if("${qt_qt_QCocoaIntegrationPlugin_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET qt::QCocoaIntegrationPlugin
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         qt_qt_QCocoaIntegrationPlugin_DEPS_TARGET)
        endif()

        set_property(TARGET qt::QCocoaIntegrationPlugin APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${qt_qt_QCocoaIntegrationPlugin_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET qt::QCocoaIntegrationPlugin APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_qt_QCocoaIntegrationPlugin_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET qt::QCocoaIntegrationPlugin APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_qt_QCocoaIntegrationPlugin_LIB_DIRS_RELEASE}>)
        set_property(TARGET qt::QCocoaIntegrationPlugin APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${qt_qt_QCocoaIntegrationPlugin_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET qt::QCocoaIntegrationPlugin APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${qt_qt_QCocoaIntegrationPlugin_COMPILE_OPTIONS_RELEASE}>)


    ########## COMPONENT Qt6::Platform #############

        set(qt_Qt6_Platform_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(qt_Qt6_Platform_FRAMEWORKS_FOUND_RELEASE "${qt_Qt6_Platform_FRAMEWORKS_RELEASE}" "${qt_Qt6_Platform_FRAMEWORK_DIRS_RELEASE}")

        set(qt_Qt6_Platform_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET qt_Qt6_Platform_DEPS_TARGET)
            add_library(qt_Qt6_Platform_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET qt_Qt6_Platform_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_Platform_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Platform_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Platform_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'qt_Qt6_Platform_DEPS_TARGET' to all of them
        conan_package_library_targets("${qt_Qt6_Platform_LIBS_RELEASE}"
                              "${qt_Qt6_Platform_LIB_DIRS_RELEASE}"
                              "${qt_Qt6_Platform_BIN_DIRS_RELEASE}" # package_bindir
                              "${qt_Qt6_Platform_LIBRARY_TYPE_RELEASE}"
                              "${qt_Qt6_Platform_IS_HOST_WINDOWS_RELEASE}"
                              qt_Qt6_Platform_DEPS_TARGET
                              qt_Qt6_Platform_LIBRARIES_TARGETS
                              "_RELEASE"
                              "qt_Qt6_Platform"
                              "${qt_Qt6_Platform_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET Qt6::Platform
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_Platform_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Platform_LIBRARIES_TARGETS}>
                     )

        if("${qt_Qt6_Platform_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET Qt6::Platform
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         qt_Qt6_Platform_DEPS_TARGET)
        endif()

        set_property(TARGET Qt6::Platform APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Platform_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET Qt6::Platform APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_Platform_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET Qt6::Platform APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_Platform_LIB_DIRS_RELEASE}>)
        set_property(TARGET Qt6::Platform APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Platform_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET Qt6::Platform APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Platform_COMPILE_OPTIONS_RELEASE}>)


    ########## COMPONENT Qt6::Core #############

        set(qt_Qt6_Core_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(qt_Qt6_Core_FRAMEWORKS_FOUND_RELEASE "${qt_Qt6_Core_FRAMEWORKS_RELEASE}" "${qt_Qt6_Core_FRAMEWORK_DIRS_RELEASE}")

        set(qt_Qt6_Core_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET qt_Qt6_Core_DEPS_TARGET)
            add_library(qt_Qt6_Core_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET qt_Qt6_Core_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_Core_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Core_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Core_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'qt_Qt6_Core_DEPS_TARGET' to all of them
        conan_package_library_targets("${qt_Qt6_Core_LIBS_RELEASE}"
                              "${qt_Qt6_Core_LIB_DIRS_RELEASE}"
                              "${qt_Qt6_Core_BIN_DIRS_RELEASE}" # package_bindir
                              "${qt_Qt6_Core_LIBRARY_TYPE_RELEASE}"
                              "${qt_Qt6_Core_IS_HOST_WINDOWS_RELEASE}"
                              qt_Qt6_Core_DEPS_TARGET
                              qt_Qt6_Core_LIBRARIES_TARGETS
                              "_RELEASE"
                              "qt_Qt6_Core"
                              "${qt_Qt6_Core_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET Qt6::Core
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${qt_Qt6_Core_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${qt_Qt6_Core_LIBRARIES_TARGETS}>
                     )

        if("${qt_Qt6_Core_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET Qt6::Core
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         qt_Qt6_Core_DEPS_TARGET)
        endif()

        set_property(TARGET Qt6::Core APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Core_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET Qt6::Core APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_Core_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET Qt6::Core APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${qt_Qt6_Core_LIB_DIRS_RELEASE}>)
        set_property(TARGET Qt6::Core APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Core_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET Qt6::Core APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${qt_Qt6_Core_COMPILE_OPTIONS_RELEASE}>)


    ########## AGGREGATED GLOBAL TARGET WITH THE COMPONENTS #####################
    set_property(TARGET qt::qt APPEND PROPERTY INTERFACE_LINK_LIBRARIES Qt6::Designer)
    set_property(TARGET qt::qt APPEND PROPERTY INTERFACE_LINK_LIBRARIES Qt6::UiTools)
    set_property(TARGET qt::qt APPEND PROPERTY INTERFACE_LINK_LIBRARIES Qt6::Help)
    set_property(TARGET qt::qt APPEND PROPERTY INTERFACE_LINK_LIBRARIES Qt6::UiPlugin)
    set_property(TARGET qt::qt APPEND PROPERTY INTERFACE_LINK_LIBRARIES Qt6::QmlWorkerScript)
    set_property(TARGET qt::qt APPEND PROPERTY INTERFACE_LINK_LIBRARIES Qt6::QmlImportScanner)
    set_property(TARGET qt::qt APPEND PROPERTY INTERFACE_LINK_LIBRARIES Qt6::QmlModels)
    set_property(TARGET qt::qt APPEND PROPERTY INTERFACE_LINK_LIBRARIES Qt6::OpenGLWidgets)
    set_property(TARGET qt::qt APPEND PROPERTY INTERFACE_LINK_LIBRARIES Qt6::PrintSupport)
    set_property(TARGET qt::qt APPEND PROPERTY INTERFACE_LINK_LIBRARIES Qt6::Qml)
    set_property(TARGET qt::qt APPEND PROPERTY INTERFACE_LINK_LIBRARIES Qt6::OpenGL)
    set_property(TARGET qt::qt APPEND PROPERTY INTERFACE_LINK_LIBRARIES Qt6::Widgets)
    set_property(TARGET qt::qt APPEND PROPERTY INTERFACE_LINK_LIBRARIES Qt6::QIcoPlugin)
    set_property(TARGET qt::qt APPEND PROPERTY INTERFACE_LINK_LIBRARIES Qt6::QGifPlugin)
    set_property(TARGET qt::qt APPEND PROPERTY INTERFACE_LINK_LIBRARIES Qt6::QCocoaIntegrationPlugin)
    set_property(TARGET qt::qt APPEND PROPERTY INTERFACE_LINK_LIBRARIES Qt6::Xml)
    set_property(TARGET qt::qt APPEND PROPERTY INTERFACE_LINK_LIBRARIES Qt6::Concurrent)
    set_property(TARGET qt::qt APPEND PROPERTY INTERFACE_LINK_LIBRARIES Qt6::Test)
    set_property(TARGET qt::qt APPEND PROPERTY INTERFACE_LINK_LIBRARIES Qt6::Sql)
    set_property(TARGET qt::qt APPEND PROPERTY INTERFACE_LINK_LIBRARIES Qt6::Network)
    set_property(TARGET qt::qt APPEND PROPERTY INTERFACE_LINK_LIBRARIES Qt6::Gui)
    set_property(TARGET qt::qt APPEND PROPERTY INTERFACE_LINK_LIBRARIES Qt6::LinguistTools)
    set_property(TARGET qt::qt APPEND PROPERTY INTERFACE_LINK_LIBRARIES qt::QCocoaIntegrationPlugin)
    set_property(TARGET qt::qt APPEND PROPERTY INTERFACE_LINK_LIBRARIES Qt6::Platform)
    set_property(TARGET qt::qt APPEND PROPERTY INTERFACE_LINK_LIBRARIES Qt6::Core)

########## For the modules (FindXXX)
set(qt_LIBRARIES_RELEASE qt::qt)
