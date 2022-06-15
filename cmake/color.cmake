if(NOT WIN32)
    string(ASCII 27 ESC)
    set(COLOUR_RESET    "${ESC}[m")
    set(COLOUR_BOLD     "${ESC}[1m")
    set(RED             "${ESC}[31m")
    set(GREEN           "${ESC}[32m")
    set(YELLOW          "${ESC}[33m")
    set(BLUE            "${ESC}[34m")
    set(MAGENTA         "${ESC}[35m")
    set(CYAN            "${ESC}[36m")
    set(WHITE           "${ESC}[37m")
    set(BOLD_RED        "${ESC}[1;31m")
    set(BOLD_GREEN      "${ESC}[1;32m")
    set(BOLD_YELLOW     "${ESC}[1;33m")
    set(BOLD_BLUE       "${ESC}[1;34m")
    set(BOLD_MAGENTA    "${ESC}[1;35m")
    set(BOLD_CYAN       "${ESC}[1;36m")
    set(BOLD_WHITE      "${ESC}[1;37m")
endif()

function(message)
    list(GET ARGV 0 MESSAGE_TYPE)
    if(MESSAGE_TYPE STREQUAL FATAL_ERROR OR MESSAGE_TYPE STREQUAL SEND_ERROR)
        list(REMOVE_AT ARGV 0)
        _message(${MESSAGE_TYPE} "${BOLD_RED}${ARGV}${COLOUR_RESET}")
    elseif(MESSAGE_TYPE STREQUAL WARNING)
        list(REMOVE_AT ARGV 0)
        _message(${MESSAGE_TYPE}
        "${BOLD_YELLOW}${ARGV}${COLOUR_RESET}")
    elseif(MESSAGE_TYPE STREQUAL AUTHOR_WARNING)
        list(REMOVE_AT ARGV 0)
        _message(${MESSAGE_TYPE} "${BOLD_CYAN}${ARGV}${COLOUR_RESET}")
    elseif(MESSAGE_TYPE STREQUAL STATUS)
        list(REMOVE_AT ARGV 0)
        _message(${MESSAGE_TYPE} "${GREEN}${ARGV}${COLOUR_RESET}")
    elseif(MESSAGE_TYPE STREQUAL INFO)
        list(REMOVE_AT ARGV 0)
        _message("${BLUE}${ARGV}${COLOUR_RESET}")
    else()
        _message("${ARGV}")
endif()
                                                                                                                    ENDFUNCTION()
