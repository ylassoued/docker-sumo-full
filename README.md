# docker-sumo-full

Docker container for the [SUMO traffic simulator](http://www.dlr.de/ts/en/desktopdefault.aspx/tabid-9883/16931_read-41000/), including Python 2.7, GDAL, PROJ, and [OSGeo Spatial Index 1.8.5](http://download.osgeo.org/libspatialindex/).

This container was borrowed from https://github.com/bogaotory/docker-sumo.

This image uses Ubuntu Trusty and contains version 0.31.0 of SUMO.

**`sumo`**, **`sumo-gui`** and **`TraCI`** are all accessible with this image.

[proj](http://proj4.org/) and [gdal](http://www.gdal.org/) are included in this image for users of OpenStreetMap.

## Usage (Option 1) - Build from Ubuntu image (Recommended)

1. Change `your_username` (line 8 of `Dockerfile`) to your username (i.e. the output of `echo "$USER"`)
2. Build the image with `docker build - < Dockerfile -t docker-sumo`
3. Run the image with
```
docker run -it --rm\
    --env="DISPLAY" \
    --volume="/etc/group:/etc/group:ro" \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/etc/shadow:/etc/shadow:ro" \
    --volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --user=$USER \
    docker-sumo \
    bash
```
4. Execute `sumo` or `sumo-gui` as usual.

1. Prepare your own `Dockerfile` with your username (i.e. the output of `echo "$USER"`):

```
FROM ylassoued/sumo-py-osgeoindex

RUN adduser your_username --disabled-password
```

2. Build the image with `docker build - < Dockerfile -t docker-sumo`
3. Run the image with
```
docker run -it --rm\
    --env="DISPLAY" \
    --volume="/etc/group:/etc/group:ro" \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/etc/shadow:/etc/shadow:ro" \
    --volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --user=$USER \
    docker-sumo \
    bash
```
4. Execute `sumo` or `sumo-gui` as usual.