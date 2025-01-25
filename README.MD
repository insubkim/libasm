intel x86/64, NASM syntax, mac os 기준으로 작성

NASM 사용법
linux : nasm -felf64 [filename];
mac : nasm -macho64 [filename];

gdb 디버깅
gdb tui 모드 설치 : 
1. wget -P ~ https://github.com/cyrus-and/gdb-dashboard/raw/master/.gdbinit
2. pip install pygments
(https://github.com/cyrus-and/gdb-dashboard)
intel syntax 변경 : set disassembly-flavor intel
gdb asm step in : si
gdb asm next : ni
gdb dashboard 확인 : dashboard -layout source assembly registers stack

메모리 확인 
x/nfu addr
n : count
f : format 'x', 'd', 'u', 'o', 't', 'a', 'c', 'f', 's'
u : 사이즈 (b 바이트, h 하프바이트, w 워드, g 더블워드)
예시.
x/100b address : 100 바이트 hex 값으로 출력
x/2xg address : print 2 X 8byte hex each line
x/4s address : print 4 string each line

make all : 라이브러리 생성
make clean : 오브젝트 삭제
make fclean : 라이브러리, 오브젝트 삭제

