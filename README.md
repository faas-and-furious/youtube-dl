# youtube-dl
YouTube download via a function

```
$ git clone https://github.com/faas-and-furious/youtube-dl \
  cd youtube-dl
```

Now deploy:

```
$ faas-cli deploy
```

The YAML file is optional:

```
$ faas-cli deploy -f \
https://raw.githubusercontent.com/faas-and-furious/youtube-dl/master/stack.yml
```

Or from the local file:

```
$ faas-cli deploy
```

Try it out:

```
$ echo -n https://www.youtube.com/watch?v=nG2rNBFzkGE | \
  faas-cli invoke youtubedl > cat_jump.mov
```

Or with `curl`:

```
$ curl localhost:8080/function/youtubedl \
 -d "https://www.youtube.com/watch?v=BJDJFMlvV_8" > cat_purr.mov
```
