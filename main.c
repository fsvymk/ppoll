#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <a.out.h>
#include <unistd.h>
#include <poll.h>
#include <time.h>

int main(int argc, char *argv[])
{
    char *buf[32];

    int i;
    for(i=0;i<32;i++) {
        buf[i] = 0;
    }

    int fd = open("/dev/usbtmc0", O_RDWR);
    printf("fd=%d ",fd);


    ssize_t szw;    // size of written in a fact.
    ssize_t szr;

    int ret;

    while(1){

        szw = write(fd,"READ?\n",6);
        szr = read(fd, &buf, 32);

        if(szw<0){
            // fd was closed. re-open it.
            //printf("reconnect. ");

            close(fd);
            fd = -1;

            while(fd==-1){
                ret = poll(fd, 0, 100);
                close(fd);
                fd = open("/dev/usbtmc0", O_RDWR);
            }
        }
        else{
            printf("\nV=%s",buf);
        }
    }

    close(fd);
}





