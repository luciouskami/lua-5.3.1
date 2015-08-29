copy lua.c lua.1
copy luac.c lua.2
del lua.c luac.c
cd ../
md lua5.3bin
cd ./src

cl -c -nologo -W3 -O2 -Ob1 -Oi -Gs -MD *.c
link -lib -out:lua5.3.lib -verbose:lib *.obj
cd ../
copy src\lua5.3.lib lua5.3bin\lua5.3.lib
cd ./src
del *.obj *.lib

cl -c -nologo -O2 -Ob1 -Oi -Gs -MD -DLUA_BUILD_AS_DLL -D_CRT_SECURE_NODEPRECATE *.c
link -link -dll -out:lua5.3.dll -verbose:lib *.obj
cd ../
copy src\lua5.3.dll lua5.3bin\lua5.3.dll
cd ./src
del *.obj *.dll


copy lua.1 lua.c
cl -c -nologo -O2 -Ob1 -Oi -Gs -MD *.c
link -link -out:lua.exe -verbose:lib *.obj
cd ../
copy src\lua.exe lua5.3bin\lua.exe
cd ./src
del *.obj *.exe lua.c

copy lua.2 luac.c
cl -c -nologo -O2 -Ob1 -Oi -Gs -MD *.c
link -link -out:luac.exe -verbose:lib *.obj
cd ../
copy src\luac.exe lua5.3bin\luac.exe
cd ./src
del *.obj *.exe luac.c *exp *lib

copy lua.2 luac.c
copy lua.1 lua.c
del lua.1 lua.2