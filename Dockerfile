# Generated by Neurodocker and Reproenv.

FROM bids/base_validator
ENV FSLDIR="/opt/fsl-6.0.1" \
    PATH="/opt/fsl-6.0.1/bin:$PATH" \
    FSLOUTPUTTYPE="NIFTI_GZ" \
    FSLMULTIFILEQUIT="TRUE" \
    FSLTCLSH="/opt/fsl-6.0.1/bin/fsltclsh" \
    FSLWISH="/opt/fsl-6.0.1/bin/fslwish" \
    FSLLOCKDIR="" \
    FSLMACHINELIST="" \
    FSLREMOTECALL="" \
    FSLGECUDAQ="cuda.q"
RUN apt-get update -qq \
    && apt-get install -y -q --no-install-recommends \
           bc \
           ca-certificates \
           curl \
           dc \
           file \
           libfontconfig1 \
           libfreetype6 \
           libgl1-mesa-dev \
           libgl1-mesa-dri \
           libglu1-mesa-dev \
           libgomp1 \
           libice6 \
           libopenblas-base \
           libxcursor1 \
           libxft2 \
           libxinerama1 \
           libxrandr2 \
           libxrender1 \
           libxt6 \
           nano \
           sudo \
           wget \
    && rm -rf /var/lib/apt/lists/* \
    && echo "Downloading FSL ..." \
    && mkdir -p /opt/fsl-6.0.1 \
    && curl -fL https://fsl.fmrib.ox.ac.uk/fsldownloads/fsl-6.0.1-centos6_64.tar.gz \
    | tar -xz -C /opt/fsl-6.0.1 --strip-components 1 \
    && echo "Installing FSL conda environment ..." \
    && bash /opt/fsl-6.0.1/etc/fslconf/fslpython_install.sh -f /opt/fsl-6.0.1 \
    && echo "Downgrading deprecation module per https://github.com/kaczmarj/neurodocker/issues/271#issuecomment-514523420" \
    && /opt/fsl-6.0.1/fslpython/bin/conda install -n fslpython -c conda-forge -y deprecation==1.* \
    && echo "Removing bundled with FSLeyes libz likely incompatible with the one from OS" \
    && rm -f /opt/fsl-6.0.1/bin/FSLeyes/libz.so.1

# Save specification to JSON.
RUN printf '{ \
  "pkg_manager": "apt", \
  "existing_users": [ \
    "root" \
  ], \
  "instructions": [ \
    { \
      "name": "from_", \
      "kwds": { \
        "base_image": "bids/base_validator" \
      } \
    }, \
    { \
      "name": "env", \
      "kwds": { \
        "FSLDIR": "/opt/fsl-6.0.1", \
        "PATH": "/opt/fsl-6.0.1/bin:$PATH", \
        "FSLOUTPUTTYPE": "NIFTI_GZ", \
        "FSLMULTIFILEQUIT": "TRUE", \
        "FSLTCLSH": "/opt/fsl-6.0.1/bin/fsltclsh", \
        "FSLWISH": "/opt/fsl-6.0.1/bin/fslwish", \
        "FSLLOCKDIR": "", \
        "FSLMACHINELIST": "", \
        "FSLREMOTECALL": "", \
        "FSLGECUDAQ": "cuda.q" \
      } \
    }, \
    { \
      "name": "run", \
      "kwds": { \
        "command": "apt-get update -qq\\napt-get install -y -q --no-install-recommends \\\\\\n    bc \\\\\\n    ca-certificates \\\\\\n    curl \\\\\\n    dc \\\\\\n    file \\\\\\n    libfontconfig1 \\\\\\n    libfreetype6 \\\\\\n    libgl1-mesa-dev \\\\\\n    libgl1-mesa-dri \\\\\\n    libglu1-mesa-dev \\\\\\n    libgomp1 \\\\\\n    libice6 \\\\\\n    libopenblas-base \\\\\\n    libxcursor1 \\\\\\n    libxft2 \\\\\\n    libxinerama1 \\\\\\n    libxrandr2 \\\\\\n    libxrender1 \\\\\\n    libxt6 \\\\\\n    nano \\\\\\n    sudo \\\\\\n    wget\\nrm -rf /var/lib/apt/lists/*\\necho \\"Downloading FSL ...\\"\\nmkdir -p /opt/fsl-6.0.1\\ncurl -fL https://fsl.fmrib.ox.ac.uk/fsldownloads/fsl-6.0.1-centos6_64.tar.gz \\\\\\n| tar -xz -C /opt/fsl-6.0.1 --strip-components 1 \\necho \\"Installing FSL conda environment ...\\"\\nbash /opt/fsl-6.0.1/etc/fslconf/fslpython_install.sh -f /opt/fsl-6.0.1\\necho \\"Downgrading deprecation module per https://github.com/kaczmarj/neurodocker/issues/271#issuecomment-514523420\\"\\n/opt/fsl-6.0.1/fslpython/bin/conda install -n fslpython -c conda-forge -y deprecation==1.*\\necho \\"Removing bundled with FSLeyes libz likely incompatible with the one from OS\\"\\nrm -f /opt/fsl-6.0.1/bin/FSLeyes/libz.so.1" \
      } \
    } \
  ] \
}' > /.reproenv.json
# End saving to specification to JSON.
