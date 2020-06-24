#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>

/**
* infinite_loop - Creates loop
*
* Return: int
*/
int infinite_loop(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
* main - Creates Zombies
*
* Return: 0
*/
int main(void)
{
	pid_t pid;
	int i = 0;

	while (i < 5)
	{
		pid = fork();
		if (pid <= 0)
			exit(0);
		else
			printf("Zombie process created, PID: %d\n", pid);
		 i++;
	}

	return (infinite_loop());
}
