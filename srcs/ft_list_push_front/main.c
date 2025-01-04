#include <stdio.h>

typedef struct s_list
{
    void    *data;
    struct  s_list  *next;
} t_list;

void    iter(t_list *head)
{
    while (head)
    {
        printf("data :%s\n", (char*)head->data);
        head = head -> next;
    }
}

int main(void)
{
    t_list  list = {0, };
    t_list* head = &list;

    extern void _ft_list_push_front(t_list **begin_list, void *data);

    _ft_list_push_front(&head, "data1");
    _ft_list_push_front(&head, "data2");
    _ft_list_push_front(&head, "data3");

    extern int _ft_list_size(t_list *head);

    int list_size = _ft_list_size(head); 
    printf("list size :%d\n", list_size);

    extern void _ft_list_sort(&head, strcmp);

    iter(head);

    return 0;
}