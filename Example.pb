XIncludeFile "Includes\Julia\julia.pbi"

UseModule Julia

OpenConsole()

; #### Function which can be called from julia
ProcedureC.d JL_Test(test.s)
  Debug test
  ProcedureReturn ValD(test) + 123
EndProcedure

; #### Do not use julia if the library isn't loaded
If Not IsLibrary(_JL_Library_ID)
  Print("Julia couldn't be loaded. Is it installed? Is the same architecture used for this application and julia (x86, x86-64)? Are environment varaibles set correctly? Press any key to exit...")
  Input()
  End
EndIf

; #### Init julia
If Not jl_init(#Null)
  Print("Julia couldn't be initialized. Are environment varaibles set correctly? Press any key to exit...")
  Input()
  End
EndIf

PrintN("Julia Version: " + PeekS(jl_ver_string(), -1, #PB_UTF8))

; #### Make JL_Test callable from julia
*Result = jl_eval_string("Something(s::String) = ccall(convert(Ptr{Void}, "+Str(@JL_Test())+~"), Float64, (Cwstring,), s)")
If jl_exception_occurred()
  PrintN("Error: " + PeekS(jl_typeof_str(jl_exception_occurred()), -1, #PB_UTF8))
EndIf

; #### Call Something (JL_Test())
*Result = jl_eval_string(~"Something(\"123.321 test\")")
If jl_exception_occurred()
  PrintN("Error: " + PeekS(jl_typeof_str(jl_exception_occurred()), -1, #PB_UTF8))
EndIf

; #### Retrieve result
If *Result And jl_is_float64(*Result)
  PrintN("Result (" + PeekS(jl_typeof_str(*Result), -1, #PB_UTF8) + "): " + StrD(jl_unbox_float64(*Result)))
EndIf

Print("Press any key to exit...")
Input()

; #### Tell julia that the program exits
jl_atexit_hook(0)
; IDE Options = PureBasic 5.42 LTS (Windows - x64)
; CursorPosition = 28
; Folding = -
; EnableUnicode
; EnableXP