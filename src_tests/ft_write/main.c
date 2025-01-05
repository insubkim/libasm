#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <sys/syscall.h>
#include <errno.h>

int main()
{
    extern ssize_t _ft_write(int fd, char *s, size_t count);
    {
        char *s = "Hello Asm!\n";

        ssize_t write_len1 = _ft_write(1, s, strlen(s));
        printf("_ft_write_len :%zd\nerrno :%d\n", write_len1, errno);
        
	ssize_t write_len2 = write(1, s, strlen(s));
        printf("write_len :%zd\nerrno :%d\n", write_len2, errno);
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
