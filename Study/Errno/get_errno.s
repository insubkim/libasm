extern __errno_location

section .text
global _get_errorno
_get_errorno:
    call __errno_location wrt ..plt 
    ret
