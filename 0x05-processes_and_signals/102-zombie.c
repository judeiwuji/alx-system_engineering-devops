#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

/**
 * infinite_while - An infinite loop
 *
 * Return: Always 0
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * main - Entry point
 *
 * Return: Always 0
 */
int main(void)
{
	pid_t pid;

	pid = fork();
	if (pid == 0)
		exit(0);
	printf("Zombie process created, PID: %d\n", (int)pid);
	pid = fork();
	if (pid == 0)
		exit(0);
	printf("Zombie process created, PID: %d\n", (int)pid);
	pid = fork();
	if (pid == 0)
		exit(0);
	printf("Zombie process created, PID: %d\n", (int)pid);
	pid = fork();
	if (pid == 0)
		exit(0);
	printf("Zombie process created, PID: %d\n", (int)pid);
	pid = fork();
	if (pid == 0)
		exit(0);
	printf("Zombie process created, PID: %d\n", (int)pid);

	infinite_while();
	return (0);
}
