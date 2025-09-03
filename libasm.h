
#ifndef LIBASM_H
# define LIBASM_H

# include <stdlib.h>
# include <sys/types.h>
# include <unistd.h>

size_t				ft_strlen(const char *s);
char				*ft_strcpy(char *dst, const char *src);
int					ft_strcmp(const char *s1, const char *s2);
ssize_t				ft_write(int fd, const void *buf, size_t nbyte);
ssize_t				ft_read(int fd, void *buf, size_t nbyte);
char				*ft_strdup(const char *s1);

// bonus yeah yeah
typedef struct s_list
{
	void			*data;
	struct s_list	*next;
}					t_list;

t_list				*ft_list_push_front_bonus(t_list **begin_list, void *data);
int					ft_list_size_bonus(t_list *begin_list);
void				ft_list_sort_bonus(t_list **begin_list, int (*cmp)());
void				ft_list_remove_if_bonus(t_list **begin_list, void *data_ref,
						int (*cmp)(), void (*free_fct)(void *));
int					ft_atoi_base_bonus(char *str, char *base);

#endif