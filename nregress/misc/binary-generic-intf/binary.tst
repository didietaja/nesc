ncc -target=mica2 -I def -c -o Foo.o -DNESC_BUILD_BINARY def/BuildBinaryFoo.nc && \
ncc -target=mica2 -I use -o FooUse.exe use/UseBinaryFoo.nc Foo.o
