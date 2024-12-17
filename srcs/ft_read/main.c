#include <unistd.h>
#include <stdio.h>
#include <string.h>

int main()
{
    extern int _ft_read(int fd, char *s, size_t count);
    {
        char buf[1024] = {0, };

        int read_len1 = _ft_read(0, buf, 1023);
        printf("\nft_read_len :%s\t%d\n", buf, read_len1);
        
        memset(buf, 0, 1024);
        int read_len2 = read(0, buf, 1023);
        printf("\nread_len :%s\t%d\n", buf, read_len2);
    }
    return 0;
}