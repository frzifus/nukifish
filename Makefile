all:
	qtdeploy -docker build sailfish .

push:
	scp deploy/sailfish/harbour-nukifish nemo@Sailfish:/home/nemo/

clean:
	rm -rf deploy
	rm rcc*
