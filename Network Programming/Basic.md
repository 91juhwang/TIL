# Network Programming

Mainly two popular types of internet sockets. 

 * Stream Sockets  

 * Datagram Sockets

## Stream Sockets

Reliable two-way connected communication streams. It will arrive in the order of requests are sent. Ex. Telnet
Stream sockets use the protocol called `Transmission Control Protocol`, known as `TCP`. TCP makes sure your data arrives sequentially and error-free.

## Datagram Sockets

Datagram sockets also use IP for routing, but they don't use TCP; they use the "User Datagram Protocol", or "UDP". UDP don't have to maintain an open connection as you do in stream sockets. UDP is much faster than TCP because UDP is not responsible for tracking requests, and it does not care if it is in the order or arrived safely and such.

 > If you're sending chat messages, TCP is great; if you're sending 40 positional updates per second of the players in the world, maybe it doesn't matter so much if one or two get dropped, and UDP is a good choice.

 ## Data Encapsulation

##### Requester: 
A packet is born, and it is wrapped in a header or footer(rarely) by the first protocol(say, TFTP), then the whole thing is encapsulated again by the next protocol(say, UDP), then again by the Internet Protocol, then again by the final protocol on the hardware(physical) layer(say, Ethernet).

##### Receiver:
When the packet arrives, the hardware strips off the Ethernet header, the kerner strips the IP and UDP headers, the TFTP program strips the TFTP header, and the packet(data) is finally transffered.

#### Layered Network Model (aka ISO/OSI)

  * Application

  * Presentation

  * Session

  * Transport

  * Network

  * Data Link

  * Physical

##### Typical UNIX layered model

  * Application Layer (telnet, ftp, etc.)

  * Host-to-Host Transport Layer (TCP, UDP)

  * Internet Layer (IP and routing)

  * Network Access Layer (Ethernet, wi-fi, or whatever)
