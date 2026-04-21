; Zero Page

!ifdef TARGET_C64 {
    zpLOMEM+1 = zp + $50  ; ptr
} else {
    zpLOMEM+1 = zp + $00  ; ptr
}
zpFSA+1     = zp + $02    ; ptr, VARTOP, end of BASIC variables
zpAESTKP+1  = zp + $04    ; ptr, BASIC Stack Pointer
zpHIMEM+1   = zp + $06    ; ptr
zpERL+1     = zp + $08    ; ptr, address of instruction that errored
zpCURSOR+1  = zp + $0a    ;      BASIC Text Pointer Offset
zpLINE+1    = zp + $0b    ; ptr, BASIC Text Pointer
zpSEED+1    = zp + $0d    ; RND work area (5 bytes)
zpTOP+1     = zp + $12    ; ptr, end of BASIC program excluding variables
zpPRINTS+1  = zp + $14    ; number of bytes in a print output field
zpPRINTF+1  = zp + $15    ; PRINT Flag
zpERRORLH+1 = zp + $16    ; ptr, error routine vector
zpTXTP+1    = zp + $18    ; _page_ number where BASIC program starts
zpAELINE+1  = zp + $19    ; ptr, secondary BASIC Text Pointer (sim. zpLINE)
zpAECUR+1   = zp + $1b    ; secondary BASIC Text Pointer Offset (sim. zpCURSOR)
zpDATAP+1   = zp + $1c    ; ptr, BASIC program start
zpTALLY+1   = zp + $1e    ; counter, number of bytes printed since last newline
zpLISTOP+1  = zp + $1f    ; LISTO Flag
zpTRFLAG+1  = zp + $20    ; TRACE Flag
zpTRNUM+1   = zp + $21    ; word, maximum trace line number
zpWIDTHV+1  = zp + $23    ; WIDTH, as set by WIDTH command
zpDOSTKP+1  = zp + $24    ; DO Stack Pointer
zpSUBSTP+1  = zp + $25    ; SUB Stack Pointer
zpFORSTP+1  = zp + $26    ; FOR Stack Pointer
zpTYPE+1    = zp + $27    ; Variable type, also temporary storage for character
zpBYTESM+1  = zp + $28    ; OPT Flag
zpOPCODE+1  = zp + $29    ; Index into opcode table
zpIACC+1    = zp + $2a    ; Integer Accumulator (32-bits)
zpFACCS+1   = zp + $2e    ; Floating Point Accumulator, SIGN
zpFACCXH+1  = zp + $2f    ; Floating Point Accumulator, OVER/UNDERFLOW
zpFACCX+1   = zp + $30    ; Floating Point Accumulator, EXPONENT
zpFACCMA+1  = zp + $31    ; Floating Point Accumulator, MANTISSA
zpFACCMB+1  = zp + $32    ; Floating Point Accumulator, MANTISSA
zpFACCMC+1  = zp + $33    ; Floating Point Accumulator, MANTISSA
zpFACCMD+1  = zp + $34    ; Floating Point Accumulator, MANTISSA
zpFACCMG+1  = zp + $35    ; Floating Point Accumulator, ROUNDING
zpCLEN+1    = zp + $36    ; Length of string buffer
zpWORK+1    = zp + $37    ; General work area, used as zpWORK+n up to n=13

zpFWRKS+1   = zp + $3b    ; Work Floating Point Accumulator, SIGN
zpFWRKXH+1  = zp + $3c    ; Work Floating Point Accumulator, OVER/UNDERFLOW
zpFWRKX+1   = zp + $3d    ; Work Floating Point Accumulator, EXPONENT
zpFWRKMA+1  = zp + $3e    ; Work Floating Point Accumulator, MANTISSA
zpFWRKMB+1  = zp + $3f    ; Work Floating Point Accumulator, MANTISSA
zpFWRKMC+1  = zp + $40    ; Work Floating Point Accumulator, MANTISSA
zpFWRKMD+1  = zp + $41    ; Work Floating Point Accumulator, MANTISSA
zpFWRKMG+1  = zp + $42    ; Work Floating Point Accumulator, ROUNDING

zpFTMPMA+1  = zp + $43    ; Temp Floating Point Accumulator, MANTISSA
zpFTMPMB+1  = zp + $44    ; Temp Floating Point Accumulator, MANTISSA
zpFTMPMC+1  = zp + $45    ; Temp Floating Point Accumulator, MANTISSA
zpFTMPMD+1  = zp + $46    ; Temp Floating Point Accumulator, MANTISSA
zpFTMPMG+1  = zp + $47    ; Temp Floating Point Accumulator, ROUNDING

zpFRDDDP+1  = zp + $48    ; Decimal Point flag
zpFRDDDX+1  = zp + $49    ; Exponent
zpFPRTDX+1  = zp + $49    ; Alt.
zpFRDDW+1   = zp + $4a
zpFQUAD+1   = zp + $4a    ; Alt. Quadrant

zpARGP+1    = zp + $4b
zpCOEFP+1   = zp + $4d    ; ptr
zpFDIGS+1   = zp + $4e    ; alternative usage (overlaps with COEFP+1
zpFPRTWN+1  = zp + $4e    ; another alternative usage (idem)
zpNEWVAR+1  = zp + $4f
zp4F+1      = zp + $4f

; ----------------------------------------------------------------------------

; Workspace

ws = workspace - $0400

VARL    = ws + $0400    ; VARiable List of resident integer variables
                        ; 4 bytes each [$0400-$046b] [@A-Z]

VARL_AT = VARL          ; @%
VARL_A  = VARL + $04    ; A%
VARL_C  = VARL + $0c    ; C%
VARL_O  = VARL + $3c    ; O%
VARL_P  = VARL + $40    ; P%
VARL_X  = VARL + $60    ; X%
VARL_Y  = VARL + $64    ; Y%

PC      = VARL_P        ; Program Counter

FWSA    = VARL + $6c    ; FP WorkSpace temporary A, 5 bytes
FWSB    = VARL + $71    ; FP WorkSpace temporary B, 5 bytes
FWSC    = VARL + $76    ; FP WorkSpace temporary C, 5 bytes
FWSD    = VARL + $7b    ; FP WorkSpace temporary D, 5 bytes

VARPTR  = ws + $0480    ; Variable Pointer Table

; Stacks

; FOR Stack, 15 entries per frame

FORINL  = ws + $0500
FORINH  = FORINL + 1
FORINT  = FORINH + 1
FORSPL  = FORINT + 1
FORSPM  = FORSPL + 1
FORSPN  = FORSPM + 1
FORSPH  = FORSPN + 1
FORSPE  = FORSPH + 1
FORLML  = FORSPE + 1
FORLMM  = FORLML + 1
FORLMN  = FORLMM + 1
FORLMH  = FORLMN + 1
FORLME  = FORLMH + 1
FORADL  = FORLME + 1
FORADH  = FORADL + 1

; (there's a hole between offset cFORTOP and DOADL)

; DO Stack

DOADL   = ws + $05a4        ; $14 bytes
DOADH   = DOADL + $14       ; $14 bytes

; SUB Stack

SUBADL  = ws + $05cc        ; $1a bytes
SUBADH  = SUBADL + $1a      ; $1a bytes

; String Work Area

STRACC  = ws + $0600

; BASIC Line Input Buffer

BUFFER  = ws + $0700

; ----------------------------------------------------------------------------

; Constants

cFORTOP = $96       ; 10 frames
cSUBTOP = $1a       ; 26 entries
cDOTOP  = $14       ; 20 entries

cTYPE_STRING = $00
cTYPE_INT    = $40
cTYPE_FLOAT  = $ff

cSIZE_INT   = $04
cSIZE_FLOAT = $05
