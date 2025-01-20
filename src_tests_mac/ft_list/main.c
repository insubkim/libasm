#include <stdio.h>
#include <string.h>
#include <stdlib.h>

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
    t_list  list = {"4", NULL};
    t_list* head = &list;

    extern void ft_list_push_front(t_list **begin_list, void *data);

    ft_list_push_front(&head, "2");
    ft_list_push_front(&head, "1");
    ft_list_push_front(&head, "3");

    extern int ft_list_size(t_list *head);

    int list_size = ft_list_size(head); 
    printf("list size :%d\n", list_size);

    extern void ft_list_sort(t_list **begin_list, int (*cmp)());
    
    printf("Before Sort\n");
    iter(head);

    ft_list_sort(&head, strcmp);
    
    printf("After Sort\n");
    iter(head);

    
    ft_list_push_front(&head, "7");
    ft_list_push_front(&head, "6");
    ft_list_push_front(&head, "5");
    ft_list_push_front(&head, "4");
    ft_list_push_front(&head, "3");
    ft_list_push_front(&head, "8");
    ft_list_push_front(&head, "2");
    ft_list_push_front(&head, "a");
    ft_list_push_front(&head, "z");
    ft_list_push_front(&head, "d");
    ft_list_push_front(&head, "e");
    ft_list_push_front(&head, "r");
    ft_list_push_front(&head, "10");

    printf("Before Sort\n");
    iter(head);

    ft_list_sort(&head, strcmp);
//     ft_list_sort(&head, strcmp);
    
    printf("After Sort\n");
    iter(head);

    extern void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));

    char *data_ref = "freeable";
    char *data = malloc(sizeof(char) * (strlen(data_ref) + 1));
    memcpy(data, data_ref, strlen(data_ref));

    ft_list_push_front(&head, data);

    printf("before remove\n");
    iter(head);

    ft_list_remove_if(&head, data_ref, strcmp, free);

    printf("after remove\n");
    iter(head);

    return 0;
}
