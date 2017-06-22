FROM resin/rpi-raspbian AS build
RUN apt-get update && apt-get install -y build-essential
COPY . /code
WORKDIR /code
RUN ./build.sh ospi
FROM resin/rpi-raspbian
COPY --from=build /code/OpenSprinkler /OpenSprinkler
CMD ["/OpenSprinkler"]
