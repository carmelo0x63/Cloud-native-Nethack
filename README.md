# Nethack, but cloud-native
The name says it all, this is good old [Nethack](https://www.nethack.org/) (the ASCII game) running in a container. Have fun!

----

<pre>
  Congratulations adventurer!
  Your quest is at an end for you have reached the home of NetHack.
  Within, the Wizard of Yendor has no power, the Oracle speaks with
  utmost clarity, and the grid bugs do not bite.
  Click friend and enter].
</pre>

If you feel you want to explore an ASCII-only, [WarGames](https://en.wikipedia.org/wiki/WarGames)-like (but innocuous), game, this is what you should do:
```
$ docker run -d \
  --rm \
  -p 49222:22 \
  --name nethack-ssh \
  --mount type=bind,source="$(pwd)"/savefiles,target=/var/games/nethack/save 
  carmelo0x63/nethack-ssh:latest
```

What does the command above do?<br/>
It first pulls (a.k.a. downloads, unless it is already stored locally) image `nethack-ssh` from repository `carmelo0x63` on [Docker Hub])(https://hub.docker.com).<br/>
Then it runs the image in a container while exposing its port 22 (internal) to port 49222 (external). It also binds `savefiles` (local directory) to `/var/games/nethack/save` directory inside the container itself.<br/>

Under the hood, the image is just Alpine Linux running Nethack (`nethack-3.6.7-r1` as of the last update of this document). Take a look at `Dockerfile` to see what it takes to create the image yourself.<br/>

To connect to the game one has to run `ssh -p 49222 nethack@<ip_address>`.<br/>

Enjoy!
