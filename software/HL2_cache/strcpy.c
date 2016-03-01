/* strcpy.c */

#include <stdio.h>
#include <idt_entrypt.h>

/* C stringcopy */

static void str_cpy( char *to, const char *from)
{
  while( *from)
  {
    *to++ = *from++;
  }
  *to = '\0';
}

int main()
{
  static char* hello = "Hello World!";
  static char to[4711] = "blaha blaj blurk bletch";
  int Time;

  printf("Strangen hello ser ut sa har: %s\n", hello);
  flush_cache();          /* toem cache-minnet */
  timer_start();          /* nollstall tidmatning */

  str_cpy( to, hello);

  Time = timer_stop();            /* las av tiden */
  printf("Time to copy: %d\n",Time);
  printf("Och kopian sa har: %s\n", to);
}


