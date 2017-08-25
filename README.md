# youtube-dl
YouTube download via a function

```
$ git clone https://github.com/faas-and-furious/youtube-dl
$ cd youtube-dl
$ docker build -t alexellis2/faas-youtubedl .
$ docker push alexellis2/faas-youtubedl
```

Now deploy:

```
$ faas-cli -action deploy \
  -image alexellis2/faas-youtubedl \
  -name youtubedl \
  -fprocess="sh ./entry.sh"
```

Try it out:

```
$ curl localhost:8080/function/youtubedl \
  -d "https://www.youtube.com/watch?v=nG2rNBFzkGE" > cat_jump.mov

$ curl localhost:8080/function/youtubedl \
 -d "https://www.youtube.com/watch?v=BJDJFMlvV_8" > cat_purr.mov
```
