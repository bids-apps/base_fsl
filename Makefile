.PHONY: Dockerfile

Dockerfile:
	docker run --rm -it kaczmarj/neurodocker:0.7.0 \
		generate docker \
			--base bids/base_validator \
			--pkg-manager apt \
			--fsl method=binaries version=6.0.3 > Dockerfile
