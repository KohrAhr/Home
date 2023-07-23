#include <stdio.h>
#include <pwd.h>

int main(void)
{
    register struct passwd *pw;

    printf("Hello World!\nHack The Planet!\n");

    pw = getpwuid(geteuid());

    if (pw)
    {
	printf("Hey mister %s, big bro are watching you!\n", pw->pw_name);
    }
    else
    {
	printf("Who are you mister UnKnown and what are you doing here?\n");
    }

    return(0);
}


