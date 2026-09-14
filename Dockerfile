ARG MINIFORGE_VERSION=26.1.1-2
ARG UBUNTU_VERSION=24.04
ARG CONDA_ENV_PATH=/opt/conda/envs/snpeff

FROM condaforge/miniforge3:${MINIFORGE_VERSION} AS builder

ARG CONDA_ENV_PATH

# Use conda to install tools and dependencies into the configured environment path
ARG SNPEFF_VERSION=5.4.0c
ARG SNPSIFT_VERSION=5.4.0c
ARG HTSLIB_VERSION=1.24

RUN mamba create -qy -p ${CONDA_ENV_PATH} \
    -c bioconda \
    -c conda-forge \
    snpeff==${SNPEFF_VERSION} \
    snpsift==${SNPSIFT_VERSION} \
    htslib==${HTSLIB_VERSION} && \
    mamba clean -afy

# Deploy the target tools into a base image
FROM ubuntu:${UBUNTU_VERSION} AS final

ARG CONDA_ENV_PATH

COPY --from=builder ${CONDA_ENV_PATH} ${CONDA_ENV_PATH}

ENV CONDA_ENV_PATH="${CONDA_ENV_PATH}" \
    PATH="${CONDA_ENV_PATH}/bin:${PATH}"

# Add a new user/group called bldocker
RUN groupadd -g 500001 bldocker && \
    useradd -r -u 500001 -g bldocker bldocker

# Change the default user to bldocker from root
USER bldocker

LABEL   maintainer="Yash Patel <ypatel@sbpdiscovery.org>" \
        org.opencontainers.image.source=https://github.com/TheBoutrosLab/docker-SnpEff
