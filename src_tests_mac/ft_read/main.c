#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>

int main()
{
    extern int ft_read(int fd, char *s, size_t count);
    {
        char buf[1024] = {0, };

        int read_len1 = ft_read(0, buf, 1023);
        printf("Errno :%d\nft_read_len :%s\t%d\n", errno, buf, read_len1);
        
        memset(buf, 0, 1024);
        int read_len2 = read(0, buf, 1023);
        printf("Errno :%d\nread_len :%s\t%d\n", errno, buf, read_len2);
    }

    {
        char buf[1024] = {0, };

        int read_len1 = ft_read(-1, buf, 1023);
        printf("Errno :%d\nft_read_len :%s\t%d\n", errno, buf, read_len1);
        
        memset(buf, 0, 1024);
        int read_len2 = read(-1, buf, 1023);
        printf("Errno :%d\nread_len :%s\t%d\n", errno, buf, read_len2);
    }
    return 0;
}
