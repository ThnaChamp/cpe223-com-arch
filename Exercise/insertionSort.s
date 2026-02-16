Data    DCD     1, 9, 8, 10, 6, 5, 4, 3, 2, 1
        MOV     R1,  #1
        MOV     R12, #10
        LDR     R0, =Data

FOR_LOOP
        CMP     R1, R12
        BGE     END_PROG
        
        LSL     R3, R1, #2
        ADD     R3, R3, R0
        LDR     R4, [R3]

        SUB     R2, R1, #1

WHILE_LOOP
        CMP     R2, #0
        BLT     SKIP_WHILE

        LSL     R5, R2, #2
        ADD     R5, R5, R0
        LDR     R6, [R5]

        CMP     R6, R4
        BLE     SKIP_WHILE

        STR     R6, [R5, #4]
        SUB     R2, R2, #1
        B       WHILE_LOOP

SKIP_WHILE
        ADD     R7, R2, #1
        LSL     R7, R7, #2
        ADD     R7, R7, R0
        STR     R4, [R7]

        ADD     R1, R1, #1
        B       FOR_LOOP

END_PROG
        END
