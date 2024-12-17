FROM postgres:15

# Install build dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    postgresql-server-dev-15 \
    wget \
    pkg-config \
    cmake \
    vim \
    pkg-config \
    libssl-dev \
    libkrb5-dev \
    curl \
    automake \
    libtool \
    postgresql-15-mysql-fdw \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /build

# Install mongo_fdw with proper configuration
RUN git clone https://github.com/EnterpriseDB/mongo_fdw.git && \
    cd mongo_fdw && \
    chmod +x autogen.sh && \
    ./autogen.sh && \
    export MONGO_FDW_SOURCE_DIR=/docker-entrypoint-initdb.d/mongo_fdw && \
    export PKG_CONFIG_PATH=$MONGO_FDW_SOURCE_DIR/mongo-c-driver/src/libmongoc/src:$MONGO_FDW_SOURCE_DIR/mongo-c-driver/src/libbson/src && \
    export LD_LIBRARY_PATH=$MONGO_FDW_SOURCE_DIR/mongo-c/lib64:$LD_LIBRARY_PATH && \
    export PATH=/usr/local/pgsql/bin/:$PATH && \
    make USE_PGXS=1 && \
    make USE_PGXS=1 install && \
    cd ..

WORKDIR /docker-entrypoint-initdb.d
