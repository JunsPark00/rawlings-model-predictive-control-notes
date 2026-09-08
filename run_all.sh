#!/usr/bin/env bash
# 모든 예제 코드 실행 스크립트

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

PASS=0
FAIL=0
ERRORS=()

run_script() {
    local file="$1"
    local rel="${file#$SCRIPT_DIR/}"
    echo ""
    echo ">>> $rel"
    if bash "$file"; then
        echo "[ OK ] $rel"
        PASS=$((PASS + 1))
    else
        echo "[FAIL] $rel"
        ERRORS+=("$rel")
        FAIL=$((FAIL + 1))
    fi
}

echo "========================================"
echo " MPC Rawlings — 전체 예제 실행 확인"
echo "========================================"

for chapter in chapter01_getting_started \
               chapter02_mpc_regulation \
               chapter03_robust_stochastic_mpc \
               chapter04_state_estimation \
               chapter05_output_mpc \
               chapter06_distributed_mpc \
               chapter07_explicit_control \
               chapter08_numerical_optimal_control; do

    echo ""
    echo "[ $chapter ]"
    notebook=""
    for candidate in "$SCRIPT_DIR/$chapter/examples/"chapter*.ipynb; do
        if [ -f "$candidate" ]; then notebook="$candidate"; break; fi
    done
    if [ -n "$notebook" ]; then
        if (source "$SCRIPT_DIR/_run_common.sh"; setup_env notebook; python "$SCRIPT_DIR/tools/check_notebooks.py" --write "$notebook"); then
            echo "[ OK ] $chapter"
            PASS=$((PASS + 1))
        else
            echo "[FAIL] $chapter"
            ERRORS+=("$chapter")
            FAIL=$((FAIL + 1))
        fi
    else
        for sh in "$SCRIPT_DIR/$chapter/"ex*_run.sh; do
            [ -f "$sh" ] && run_script "$sh"
        done
    fi
done

echo ""
echo "========================================"
echo " 결과: PASS=$PASS  FAIL=$FAIL"
echo "========================================"

if [ ${#ERRORS[@]} -gt 0 ]; then
    echo ""
    echo "실패한 예제:"
    for e in "${ERRORS[@]}"; do
        echo "  - $e"
    done
    exit 1
fi
