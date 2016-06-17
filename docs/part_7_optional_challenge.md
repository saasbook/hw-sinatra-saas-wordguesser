# Optional challenge assignment


Verify that a file exists in the courseware VM called
`/usr/share/dict/words`.  What's in it?

(Note: if this file doesn't exist, you can install it on Ubuntu 14 by
typing `sudo apt-get install --reinstall wamerican`.  On other
distributions or non-Linux versions of Unix, the file may be 
[elsewhere](http://objectroot.org/articles/brief-history-of-hier/), or
absent. 

> This file has been part of Unix since almost 
> [the beginning of time](http://en.wikipedia.org/wiki/Unix_time).
> It has been used by programs ranging from spelling
> checkers to password guessers.

Why do you think we used a remote SOA endpoint to generate random words
for Hangperson rather than `/usr/share/dict/words`?  (Hint: It's not
simply to give you an initial taste of using SOA.)

> In many hosted deployment environments, you cannot rely on the
> presence of the local filesystem, and in shared environments such as
> Heroku you may not have access to the filesystem at all.  All state
> must be stored in managed storage such as a database or other per-app
> abstraction, or managed on remote servers.


Using Sinatra, create and deploy locally (on your computer) a *SOA
endpoint* that mimics the behavior of the Random Word Generator service
we used in this assignment.  A simple implementation would respond to the
RESTful request `GET /` with a random word drawn randomly from
`/usr/share/dict/words`. 
