.PHONY: Dockerfile

Dockerfile:
	docker run --rm kaczmarj/neurodocker:0.7.0 generate docker \
		--base debian:buster-slim --pkg-manager apt \
		--install nodejs npm \
        --fsl method=binaries version=6.0.3 \
		--run-bash "node -v && npm -v && npm install -g bids-validator"> Dockerfile
