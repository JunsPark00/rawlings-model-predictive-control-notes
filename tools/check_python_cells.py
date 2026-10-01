"""Verify plain-Python notebook cells in a fresh process per chapter.

This opt-in fallback does NOT test a Jupyter kernel, notebook frontend, or Colab.
It leaves notebooks and committed figures unchanged. Use check_notebooks.py for
normal kernel validation. The notebooks must contain only ordinary Python cells.
"""
import argparse
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile

import nbformat

ROOT = Path(__file__).resolve().parents[1]


def execute(path, report):
    import numpy as np
    import matplotlib
    matplotlib.use("Agg")
    import matplotlib.pyplot as plt

    notebook = nbformat.read(path, as_version=4)
    nbformat.validate(notebook)
    namespace = {"__name__": "__main__"}
    count = 0
    with tempfile.TemporaryDirectory(prefix="mpc-python-cells-") as directory:
        os.chdir(directory)
        for index, cell in enumerate(notebook.cells):
            if cell.cell_type != "code":
                continue
            # compile deliberately rejects IPython magics and shell escapes.
            compiled = compile(cell.source, f"{path.name}:cell-{index}", "exec")
            count += 1
            print(f"[{path.name}] code cell {count} (index {index})", flush=True)
            exec(compiled, namespace)
            plt.close("all")
        checks = namespace.get("CHECKS")
        if not isinstance(checks, dict) or not checks:
            raise ValueError("Notebook did not produce a nonempty CHECKS dictionary")
        figures = sorted(p.name for p in Path("figures").glob("*.png"))
        result = {
            "notebook": str(path.relative_to(ROOT)),
            "mode": "fresh-python-process",
            "python": sys.version.split()[0],
            "code_cells": count,
            "metrics": {key: value.item() if isinstance(value, np.generic) else value
                        for key, value in checks.items()},
            "figures": figures,
            "limitations": "No Jupyter kernel, frontend, rich-output or Colab validation",
        }
        report.write_text(json.dumps(result, ensure_ascii=False, indent=2, allow_nan=False) + "\n", encoding="utf-8")
        print(f"PASS fresh Python process: {path.name}, {count} cells, {len(checks)} metrics", flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("paths", nargs="*", type=Path)
    parser.add_argument("--report", type=Path, help="Write aggregated actual metrics as JSON")
    parser.add_argument("--timeout", type=int, default=900, help="Per-chapter process timeout in seconds")
    parser.add_argument("--child", nargs=2, type=Path, help=argparse.SUPPRESS)
    args = parser.parse_args()
    if args.child:
        execute(args.child[0].resolve(), args.child[1].resolve())
        return
    if args.timeout <= 0:
        parser.error("--timeout must be positive")
    paths = [p.resolve() for p in args.paths] or sorted(ROOT.glob("chapter*/examples/chapter*.ipynb"))
    if not paths:
        parser.error("No notebooks found")
    results = []
    with tempfile.TemporaryDirectory(prefix="mpc-cell-reports-") as directory:
        for index, path in enumerate(paths):
            report = Path(directory) / f"{index}.json"
            subprocess.run([sys.executable, str(Path(__file__).resolve()), "--child", str(path), str(report)],
                           check=True, timeout=args.timeout)
            results.append(json.loads(report.read_text(encoding="utf-8")))
    if args.report:
        args.report.resolve().write_text(json.dumps(results, ensure_ascii=False, indent=2, allow_nan=False) + "\n", encoding="utf-8")
    print(f"PASS {len(results)} notebooks in separate Python processes; Jupyter/Colab not tested", flush=True)


if __name__ == "__main__":
    main()
