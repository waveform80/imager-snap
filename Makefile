all: pack

clean:
	snapcraft clean

pack:
	snapcraft pack --verbose
