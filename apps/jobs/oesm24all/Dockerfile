FROM rocker/shiny:4.5.2

# System dependencies for querychat/duckdb
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install remotes for version-pinned installation
RUN R -e "install.packages('remotes', repos='https://cloud.r-project.org')"

# Install CRAN packages with pinned versions
RUN R -e "remotes::install_version('shiny', version = '1.12.1', repos = 'https://cloud.r-project.org')"
RUN R -e "remotes::install_version('bslib', version = '0.10.0', repos = 'https://cloud.r-project.org')"
RUN R -e "remotes::install_version('DT', version = '0.34.0', repos = 'https://cloud.r-project.org')"
RUN R -e "remotes::install_version('dplyr', version = '1.2.0', repos = 'https://cloud.r-project.org')"
RUN R -e "remotes::install_version('RSQLite', version = '2.4.5', repos = 'https://cloud.r-project.org')"
RUN R -e "remotes::install_version('bsicons', version = '0.1.2', repos = 'https://cloud.r-project.org')"

# Install r-universe packages with pinned versions (querychat and dependencies)
RUN R -e "remotes::install_version('ellmer', version = '0.4.0', repos = c('https://posit-dev.r-universe.dev', 'https://cloud.r-project.org'))"
RUN R -e "remotes::install_version('shinychat', version = '0.3.0', repos = c('https://posit-dev.r-universe.dev', 'https://cloud.r-project.org'))"
RUN R -e "remotes::install_version('querychat', version = '0.2.0', repos = c('https://posit-dev.r-universe.dev', 'https://cloud.r-project.org'))"

# Copy application code
COPY app.R app.R
COPY data/ data/

# Verify critical packages are available
RUN R -e "stopifnot(requireNamespace('shiny', quietly = TRUE))" \
    && R -e "stopifnot(requireNamespace('querychat', quietly = TRUE))"

EXPOSE 7860

CMD ["R", "--quiet", "-e", "shiny::runApp('/app', host='0.0.0.0', port=7860)"]
