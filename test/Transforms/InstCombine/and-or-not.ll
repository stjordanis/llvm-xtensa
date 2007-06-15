; RUN: llvm-as < %s | opt -instcombine | llvm-dis | grep xor | wc -l | grep 2
; RUN: llvm-as < %s | opt -instcombine | llvm-dis | not grep and
; RUN: llvm-as < %s | opt -instcombine | llvm-dis | not grep { or}

; PR1510

; These are all equivelent to A^B

define i32 @test1(i32 %a, i32 %b) {
entry:
        %tmp3 = or i32 %b, %a           ; <i32> [#uses=1]
        %tmp3not = xor i32 %tmp3, -1            ; <i32> [#uses=1]
        %tmp6 = and i32 %b, %a          ; <i32> [#uses=1]
        %tmp7 = or i32 %tmp6, %tmp3not          ; <i32> [#uses=1]
        %tmp7not = xor i32 %tmp7, -1            ; <i32> [#uses=1]
        ret i32 %tmp7not
}

define i32 @test2(i32 %a, i32 %b) {
entry:
        %tmp3 = or i32 %b, %a           ; <i32> [#uses=1]
        %tmp6 = and i32 %b, %a          ; <i32> [#uses=1]
        %tmp6not = xor i32 %tmp6, -1            ; <i32> [#uses=1]
        %tmp7 = and i32 %tmp3, %tmp6not         ; <i32> [#uses=1]
        ret i32 %tmp7
}

