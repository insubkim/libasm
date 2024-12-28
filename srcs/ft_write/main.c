#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <sys/syscall.h>


int main()
{
    extern ssize_t ft_write(int fd, char *s, size_t count);
    {
        char *s = "Hello Asm!\n";

        ssize_t write_len1 = ft_write(1, s, strlen(s));
        printf("ft_write_len :%zd\n", write_len1);
        
        ssize_t write_len2 = write(1, s, strlen(s));
        printf("write_len :%zd\n", write_len2);
    }
    return 0;
}