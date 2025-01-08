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


make all : 라이브러리 생성
make clean : 오브젝트 삭제
make fclean : 라이브러리, 오브젝트 삭제
