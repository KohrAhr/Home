#include <stdio.h>
#include <pwd.h>

int main(void)
{
    int result = 255;
    register struct passwd *pw;

    printf("Hello *NIX World!\nHack The Planet!\n");

    pw = getpwuid(geteuid());

    result = (pw != NULL ? 0 : 1);

    if (result == 0)
    {
	printf("Hey mister %s, big bro are watching you!\n", pw->pw_name);
    }
    else
    {
	printf("Who are you mister UnKnown and what are you doing here?\n");
    }

    for (int c = 0;c < 100;c++)
    {
	printf("\r%d", c);
	fflush(stdout);
	sleep(1);
    }
    printf("\n");

    return(result);
}
