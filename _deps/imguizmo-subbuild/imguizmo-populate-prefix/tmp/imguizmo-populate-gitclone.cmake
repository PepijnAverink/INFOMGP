
if(NOT "C:/Users/pepij/Downloads/INFOMGP-Practical1-master/INFOMGP-Practical1-master/build/_deps/imguizmo-subbuild/imguizmo-populate-prefix/src/imguizmo-populate-stamp/imguizmo-populate-gitinfo.txt" IS_NEWER_THAN "C:/Users/pepij/Downloads/INFOMGP-Practical1-master/INFOMGP-Practical1-master/build/_deps/imguizmo-subbuild/imguizmo-populate-prefix/src/imguizmo-populate-stamp/imguizmo-populate-gitclone-lastrun.txt")
  message(STATUS "Avoiding repeated git clone, stamp file is up to date: 'C:/Users/pepij/Downloads/INFOMGP-Practical1-master/INFOMGP-Practical1-master/build/_deps/imguizmo-subbuild/imguizmo-populate-prefix/src/imguizmo-populate-stamp/imguizmo-populate-gitclone-lastrun.txt'")
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E rm -rf "C:/Users/pepij/Downloads/INFOMGP-Practical1-master/INFOMGP-Practical1-master/build/_deps/imguizmo-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: 'C:/Users/pepij/Downloads/INFOMGP-Practical1-master/INFOMGP-Practical1-master/build/_deps/imguizmo-src'")
endif()

# try the clone 3 times in case there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "C:/Program Files/Git/cmd/git.exe"  clone --no-checkout "https://github.com/CedricGuillemet/ImGuizmo.git" "imguizmo-src"
    WORKING_DIRECTORY "C:/Users/pepij/Downloads/INFOMGP-Practical1-master/INFOMGP-Practical1-master/build/_deps"
    RESULT_VARIABLE error_code
    )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once:
          ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'https://github.com/CedricGuillemet/ImGuizmo.git'")
endif()

execute_process(
  COMMAND "C:/Program Files/Git/cmd/git.exe"  checkout a23567269f6617342bcc112394bdad937b54b2d7 --
  WORKING_DIRECTORY "C:/Users/pepij/Downloads/INFOMGP-Practical1-master/INFOMGP-Practical1-master/build/_deps/imguizmo-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: 'a23567269f6617342bcc112394bdad937b54b2d7'")
endif()

set(init_submodules TRUE)
if(init_submodules)
  execute_process(
    COMMAND "C:/Program Files/Git/cmd/git.exe"  submodule update --recursive --init 
    WORKING_DIRECTORY "C:/Users/pepij/Downloads/INFOMGP-Practical1-master/INFOMGP-Practical1-master/build/_deps/imguizmo-src"
    RESULT_VARIABLE error_code
    )
endif()
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: 'C:/Users/pepij/Downloads/INFOMGP-Practical1-master/INFOMGP-Practical1-master/build/_deps/imguizmo-src'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy
    "C:/Users/pepij/Downloads/INFOMGP-Practical1-master/INFOMGP-Practical1-master/build/_deps/imguizmo-subbuild/imguizmo-populate-prefix/src/imguizmo-populate-stamp/imguizmo-populate-gitinfo.txt"
    "C:/Users/pepij/Downloads/INFOMGP-Practical1-master/INFOMGP-Practical1-master/build/_deps/imguizmo-subbuild/imguizmo-populate-prefix/src/imguizmo-populate-stamp/imguizmo-populate-gitclone-lastrun.txt"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: 'C:/Users/pepij/Downloads/INFOMGP-Practical1-master/INFOMGP-Practical1-master/build/_deps/imguizmo-subbuild/imguizmo-populate-prefix/src/imguizmo-populate-stamp/imguizmo-populate-gitclone-lastrun.txt'")
endif()

