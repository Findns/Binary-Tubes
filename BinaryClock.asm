;CLOCK FOR BINARY FEEDED
;NIXIE TUBES
;Enjoie !
;BY FINDNS
;WORKS ON 8086 (i think)

ORG 100h  
 
MOV AX, 03h
INT 10h   ;set video mode (80x25chars)

MOV DH, 2D
CALL tubes
MOV DH, 4d
CALL tubes
MOV DH, 6D
CALL tubes  ;print each line of tubes


beta_worldline:
MOV AH, 2Ch
INT 21h       ;put system time into DH, CL and CH
MOV sec, DH
MOV min, CL
MOV hour, CH
MOV SI, 0
fill_arrays:  

SHL sec, 1
MOV sec_array[SI], 01h 
JC one_s ;if 1 
MOV sec_array[SI], 00h
one_s: 

SHL min, 1
MOV min_array[SI], 01h
JC one_m  
MOV min_array[SI], 00h
one_m: 

SHL hour, 1                ;shift the firt bit of each var
MOV hour_array[SI], 01h    ;and set array value accordingly
JC one_h  
MOV hour_array[SI], 00h   
one_h:                    

INC SI
CMP SI, 8
JL fill_arrays             ;loop 8 times

;TODO : display loop
MOV SI, 2
MOV DH, 02d
MOV DL, 22d
tube_sec:
MOV AH, 2
INT 10h  
CALL off 
MOV AH, 2
INT 10h 
CMP sec_array[SI], 1
JE light_sec
JMP next_sec:
light_sec:
CALL on
next_sec:
INC SI
ADD DL, 4d
CMP SI, 8
JL tube_sec 
;minutes lights
MOV SI, 2
MOV DH, 04d
MOV DL, 22d
tube_min:
MOV AH, 2
INT 10h  
CALL off 
MOV AH, 2
INT 10h 
CMP min_array[SI], 1
JE light_min
JMP next_min:
light_min:
CALL on
next_min:
INC SI
ADD DL, 4d
CMP SI, 8
JL tube_min 
;hours lights
MOV SI, 3
MOV DH, 06d
MOV DL, 22d
tube_hour:
MOV AH, 2
INT 10h  
CALL off 
MOV AH, 2
INT 10h 
CMP hour_array[SI], 1
JE light_hour
JMP next_hour:
light_hour:
CALL on
next_hour:
INC SI
ADD DL, 4d
CMP SI, 8
JL tube_hour


JMP beta_worldline  ;back to the mail 
;procedures
on PROC 
PUSH DX
MOV DL, 0Fh   
MOV AH, 6h
INT 21h     ;print an underscore 
POP DX 
ret
on ENDP 

off PROC 
PUSH DX
MOV DL, 020h   
MOV AH, 6h
INT 21h     ;print an underscore
POP DX  
ret
off ENDP

tubes PROC 
MOV DL,  21d      
MOV AH, 2
INT 10h     ;set cursor pos.
MOV DL, 07Bh   
MOV AH, 6h
INT 21h     ;print an underscore     

MOV DL,  23d      
MOV AH, 2
INT 10h     ;set cursor pos.
MOV DL, 07Dh   
MOV AH, 6h
INT 21h     ;print an underscore 

MOV DL,  25d      
MOV AH, 2
INT 10h     ;set cursor pos.
MOV DL, 07Bh   
MOV AH, 6h
INT 21h     ;print an underscore 
MOV DL,  27d
      
MOV AH, 2
INT 10h     ;set cursor pos.
MOV DL, 07Dh   
MOV AH, 6h
INT 21h     ;print an underscore
MOV DL,  29d
      
MOV AH, 2
INT 10h     ;set cursor pos.
MOV DL, 07Bh   
MOV AH, 6h
INT 21h     ;print an underscore
MOV DL,  31d
      
MOV AH, 2
INT 10h     ;set cursor pos.
MOV DL, 07Dh   
MOV AH, 6h
INT 21h     ;print an underscore 
MOV DL,  33d
      
MOV AH, 2
INT 10h     ;set cursor pos.
MOV DL, 07Bh   
MOV AH, 6h
INT 21h     ;print an underscore 
MOV DL,  35d
      
MOV AH, 2
INT 10h     ;set cursor pos.
MOV DL, 07Dh   
MOV AH, 6h
INT 21h     ;print an underscore 
MOV DL,  37d
      
MOV AH, 2
INT 10h     ;set cursor pos.
MOV DL, 07Bh   
MOV AH, 6h
INT 21h     ;print an underscore 
MOV DL,  39d
      
MOV AH, 2
INT 10h     ;set cursor pos.
MOV DL, 07Dh   
MOV AH, 6h
INT 21h     ;print an underscore 
MOV DL,  41d
      
MOV AH, 2
INT 10h     ;set cursor pos.
MOV DL, 07Bh   
MOV AH, 6h
INT 21h     ;print an underscore  
MOV DL,  43d
      
MOV AH, 2
INT 10h     ;set cursor pos.
MOV DL, 07Dh   
MOV AH, 6h
INT 21h     ;print an underscore 
MOV DL,  45d
      
MOV AH, 2
INT 10h     ;set cursor pos.
MOV DL, 07Bh   
MOV AH, 6h
INT 21h     ;print an underscore  
MOV DL,  47d
      
MOV AH, 2
INT 10h     ;set cursor pos.
MOV DL, 07Dh   
MOV AH, 6h
INT 21h     ;print an underscore 
MOV DL,  49d
      
MOV AH, 2
INT 10h     ;set cursor pos.
MOV DL, 07Bh   
MOV AH, 6h
INT 21h     ;print an underscore  
MOV DL,  51d
      
MOV AH, 2
INT 10h     ;set cursor pos.
MOV DL, 07Dh   
MOV AH, 6h
INT 21h     ;print an underscore  
ret
tubes ENDP 

RET     
;vars
sec        DB 00h
min        DB 00h
hour       DB 00h
sec_array  DB 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h
min_array  DB 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h
hour_array DB 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h




