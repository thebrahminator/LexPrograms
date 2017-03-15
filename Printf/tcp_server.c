#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<string.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<arpa/inet.h>
#include<netinet/in.h>

#define PORT 3062

int main()
{
    int client, server;
    struct sockaddr_in serverSocket, clientSocket;
    int bin, lis, acc;
    socklen_t clilen;
    char buffer[1024];
    server = socket(AF_INET, SOCK_STREAM, 0);
    if(server<0)
    {
        printf("Socket Creation Failed\n");
        exit(0);
    }

    bzero((struct sockaddr*) &serverSocket, sizeof(serverSocket));
    bzero((struct sockaddr*) &clientSocket, sizeof(clientSocket));

    serverSocket.sin_family = AF_INET;
    serverSocket.sin_port = htons(PORT);
    serverSocket.sin_addr.s_addr = htons(INADDR_ANY);

    bin = bind(server, (struct sockaddr*) &serverSocket, sizeof(serverSocket));

    if(bin<0)
    {
        printf("Binding Failed\n");
        exit(0);
    }

    lis = listen(server, 10);

    if(lis<0)
    {
        printf("Listening Failed\n");
        exit(0);
    }

    clilen = sizeof(clientSocket);

    //client = accept(server, (struct sockaddr*) &clientSocket, sizeof(clientSocket));
    client = accept(server, (struct sockaddr*) &clientSocket, &clilen);

    if(client<0)
    {
        printf("Accepting Failed\n");
        exit(0);
    }

    do
    {
        read(client, buffer, sizeof(buffer));
        
        printf("Client : %s\n", buffer);
        
        //if(!strcmp(buffer, "bye"))
          //  break;
        printf("Server Message: ");
        //fgets(buffer, 1024, stdin);
        scanf("%s", buffer);
        write(client, buffer, sizeof(buffer));

    }while( (strcmp(buffer,"bye") != 0) );

    close(client);
    close(server);

    return 0;
}

