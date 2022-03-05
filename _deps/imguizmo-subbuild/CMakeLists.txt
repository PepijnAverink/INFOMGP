# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.17.2)

# We name the project and the target for the ExternalProject_Add() call
# to something that will highlight to the user what we are working on if
# something goes wrong and an error message is produced.

project(imguizmo-populate NONE)

include(ExternalProject)
ExternalProject_Add(imguizmo-populate
                     "UPDATE_DISCONNECTED" "False" "GIT_REPOSITORY" "https://github.com/CedricGuillemet/ImGuizmo.git" "GIT_TAG" "a23567269f6617342bcc112394bdad937b54b2d7"
                    SOURCE_DIR          "C:/Users/pepij/Downloads/INFOMGP-Practical1-master/INFOMGP-Practical1-master/build/_deps/imguizmo-src"
                    BINARY_DIR          "C:/Users/pepij/Downloads/INFOMGP-Practical1-master/INFOMGP-Practical1-master/build/_deps/imguizmo-build"
                    CONFIGURE_COMMAND   ""
                    BUILD_COMMAND       ""
                    INSTALL_COMMAND     ""
                    TEST_COMMAND        ""
                    USES_TERMINAL_DOWNLOAD  YES
                    USES_TERMINAL_UPDATE    YES
)
