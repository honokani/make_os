; myhello_os

; IGNORE warning by RESB command

; A-Drive setting
    DB      0xeb, 0x4e, 0x90
    DB      "MyHello "      ; free: boot sector name (8byte)
    DW      512             ; must: sector size
    DB      1               ; must: claster size
    DW      1               ; comm: FAT start pos
    DB      2               ; must: FAT num
    DW      224             ; root dir area size
    DW      2880            ; must: Drive size
    DB      0xf0            ; must: media type
    DW      9               ; must: FAT area length
    DW      18              ; must: sector num par a track
    DW      2               ; must: head num
    DD      0               ; must: no use partition
    DD      2880            ; must: Drive size (again)
    DB      0, 0, 0x29      ; must: idk
    DD      0xffffffff      ; must: serial num of volume (maybe)
    DB      "MyHelloOs  "   ; free: disk name (11byte)
    DB      "FAT12   "      ; free: format name (8byte)
    RESB    18              ; comm: For now, use 18

; program body
    DB      0xb8, 0x00, 0x00, 0x8e, 0xd0, 0xbc, 0x00, 0x7c
    DB      0x8e, 0xd8, 0x8e, 0xc0, 0xbe, 0x74, 0x7c, 0x8a
    DB      0x04, 0x83, 0xc6, 0x01, 0x3c, 0x00, 0x74, 0x09
    DB      0xb4, 0x0e, 0xbb, 0x0f, 0x00, 0xcd, 0x10, 0xeb
    DB      0xee, 0xf4, 0xeb, 0xfd

; message part
    DB      0x0a, 0x0a              ; 2 new lines
    DB      "Hello, My first OS."   ; main message
    DB      0x0a                    ; 1 new line
    DB      0

    RESB    0x1fe-($-$$)        ; Until 0x1f, fill 0x00 in blank

    DB      0x55, 0xaa

; other than boot sector
    DB      0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
    RESB    4600
    DB      0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
    RESB    1469432
