void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *))
{
    if (!begin_list || !*begin_list || !cmp || free_fct)
        return ;

    // cmp 
    // delete
    // if first? first = first -> next
    // else prev -> next = node -> next

    t_list* prev = NULL;
    t_list* node = *begin_list;

    while (*node)
    {
        if (cmp(node -> data, data_ref))
        {
            free_fct(node -> data);
            if (prev)
            {
                prev -> next = node -> next;
            }
            else
            {
                *begin_list = node -> next;
            }
        }
        prev = node;
        node = node -> next;
    }
}
