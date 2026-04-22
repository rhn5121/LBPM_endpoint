#!/bin/bash

# 1. Vim 설치 확인 및 설치
if ! command -v vim &> /dev/null; then
    echo "📦 Vim 설치 중..."
    apt-get update && apt-get install -y vim
else
    echo "✅ Vim 이미 설치됨"
fi

# 2. 환경 변수 설정
export MPI_DIR=/opt/openmpi
export SILO_DIR=/opt/silo
export LBPM_SRC_BUILD=/opt/lbpm-src/build

export PATH="$MPI_DIR/bin:$SILO_DIR/bin:$LBPM_SRC_BUILD/bin:$PATH"
export LD_LIBRARY_PATH="$MPI_DIR/lib:$SILO_DIR/lib:$LBPM_SRC_BUILD/lib:/usr/lib/x86_64-linux-gnu/hdf5/serial:$LD_LIBRARY_PATH"
export OMPI_ALLOW_RUN_AS_ROOT=1
export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1

# 3. 실행 권한 부여
chmod +x $LBPM_SRC_BUILD/bin/* 2>/dev/null || true

echo "🚀 설정 완료!"
