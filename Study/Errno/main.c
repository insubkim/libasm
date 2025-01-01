#include <stdio.h>
#include <unistd.h>
#include <errno.h>

int main()
{
    write(-1, "hello", 5);
    // 9 is for bad file descriptor
    printf ("Write Errno :%d\n", errno);

    extern int _get_errorno(void);

    int recent_errno = _get_errorno();
    printf ("recent Errno :%d\n", recent_errno);


    return 0;
}