# Cloud-native-Nethack
The name says it all, this is good old [Nethack](https://www.nethack.org/) running in a container. Have fun!

----

<pre>
  Congratulations adventurer!
  Your quest is at an end for you have reached the home of NetHack.
  Within, the Wizard of Yendor has no power, the [Oracle](http://internetoracle.org/) speaks with utmost clarity, and the [grid bugs](https://tron.fandom.com/wiki/Gridbug) do not bite.
  Click [friend and enter](https://www.nethack.org/common/index.html).
</pre>

If you feel you want to explore an ASCII-only, War Games-like (but innocuous), game, this is what you should do:
```
$ docker run -d \
  --rm \
  -p 49222:22 \
  --name nethack-ssh \
  --mount type=bind,source="$(pwd)"/savefiles,target=/var/games/nethack/save 
  carmelo0x63/nethack-ssh:latest
```

What the command above does? It first pulls (a.k.a. downloads), unless it is already stored locally, image `nethack-ssh` from repository `carmelo0x63` on [Docker Hub])(https://hub.docker.com).<br/>
Then it runs the image in a container while exposing its port 22 (internal) to port 49222. It also binds `savefiles` (local directory) to `/var/games/nethack/save` directory inside the container itself.<br/>

To connect to the game one has to run `ssh -p 49222 nethack@<ip_address>`.

Enjoy!
