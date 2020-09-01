FROM balenalib/raspberry-pi AS build
RUN apt-get update && apt-get install -y build-essential
COPY . /code
WORKDIR /code
RUN ./build.sh ospi
FROM balenalib/raspberry-pi
COPY --from=build /code/OpenSprinkler /OpenSprinkler
WORKDIR /data
VOLUME /data
CMD ["/OpenSprinkler"]
