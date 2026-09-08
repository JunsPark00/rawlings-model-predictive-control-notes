#!/bin/bash
set -e

export PATH="$HOME/.local/bin:$PATH"

# uv 설치 확인
if ! command -v uv &> /dev/null; then
    echo "uv를 설치합니다..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    export PATH="$HOME/.local/bin:$PATH"
fi

echo "uv 버전: $(uv --version)"

# 가상환경 생성
echo "가상환경 생성 중 (.venv, Python 3.11)..."
uv venv --python 3.11

# 의존성 설치
echo "의존성 설치 중..."
uv pip install -e .

echo ""
echo "완료! 가상환경 활성화 방법:"
echo "  source .venv/bin/activate"
