.PHONY: Dockerfile

Dockerfile:
	docker run --rm -i kaczmarj/neurodocker:0.9.1 \
		generate docker \
			--base-image bids/base_validator \
			--pkg-manager apt \
			--yes \
			--fsl method=binaries version=6.0.0 > Dockerfile
