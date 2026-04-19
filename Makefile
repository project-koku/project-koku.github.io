.PHONY: build serve clean

build:
	hugo --gc --minify

serve:
	hugo server -D

clean:
	rm -rf public/
