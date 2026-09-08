#!/usr/bin/env bash
# 공통 환경 설정 — 각 챕터 run 스크립트에서 source 합니다.
# 위치: 저장소 루트 (_run_common.sh)

REPO_ROOT="$(cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")" && pwd)"
VENV="$REPO_ROOT/.venv"

setup_env() {
    if [ ! -d "$VENV" ]; then
        echo "[INFO] 가상환경 생성 중 (Python 3.11)..."
        uv venv "$VENV" --python 3.11
    fi
    source "$VENV/bin/activate"
    if [ "${1:-}" = "notebook" ]; then
        if ! python -c 'import nbformat, nbclient, ipykernel, numpy, scipy, matplotlib, cvxpy, osqp, casadi' 2>/dev/null; then
            echo "[INFO] 노트북 실행 패키지 설치 중..."
            uv pip install --python "$VENV/bin/python" -r "$REPO_ROOT/requirements-colab.txt" nbformat nbclient ipykernel
        fi
    elif ! python -c 'import numpy, scipy, matplotlib, cvxpy, control, casadi, PIL' 2>/dev/null; then
        echo "[INFO] 기존 예제 패키지 설치 중..."
        uv pip install --python "$VENV/bin/python" numpy scipy matplotlib cvxpy control casadi pillow
    fi
    # 디스플레이 없는 환경에서는 Agg 백엔드 사용
    if [ -z "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ]; then
        export MPLBACKEND=Agg
    fi
}
