#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <sys/syscall.h>
#include <errno.h>

#define KRED  "\x1B[31m"

void check_result(ssize_t a, ssize_t b)
{
	if (a == b)
	{
		printf("%sFAIL\n", KRED);
		exit(0);
	}
}

int main()
{
    extern ssize_t _ft_write(int fd, char *s, size_t count);
    {
        char *s = "Hello Asm!\n";

        ssize_t write_len1 = _ft_write(1, s, strlen(s));
        printf("_ft_write_len :%zd\nerrno :%d\n", write_len1, errno);
        
	ssize_t write_len2 = write(1, s, strlen(s));
        printf("write_len :%zd\nerrno :%d\n", write_len2, errno);
	check_result(write_len1, write_len1);
    }

    {
        char *s = "Hello Asm!\n";

        ssize_t write_len1 = _ft_write(-1, s, strlen(s));
        printf("_ft_write_len :%zd\nerrno :%d\n", write_len1, errno);
        
        ssize_t write_len2 = write(-1, s, strlen(s));
        printf("write_len :%zd\nerrno :%d\n", write_len2, errno);
    }
    return 0;
}
