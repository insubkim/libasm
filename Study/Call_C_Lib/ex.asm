
          global    main
          extern    puts

          section   .text
main:                                       ; This is called by the C library startup code
          lea       rdi, [rel message]            ; First integer (or pointer) argument in rdi
          sub       rsp, 8
          call      puts wrt ..plt                   ; puts(message)
          add       rsp, 8
          ret                               ; Return from main back into C library wrapper
          section   .data
message:
          db        "Hola, mundo", 0        ; Note strings must be terminated with 0 in C