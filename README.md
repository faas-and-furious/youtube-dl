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
$ faas-cli deploy -f stack.yml
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
