"""Run chapter notebooks in temporary directories using the current Python.

Default: verify every renewed chapter without changing files.
With --write PATH: save executed cells and copy figures to its existing slides/.
"""
import argparse
from pathlib import Path
import shutil
import sys
import tempfile

import nbformat
from nbclient import NotebookClient

ROOT = Path(__file__).resolve().parents[1]


def run(path, write=False):
    nb = nbformat.read(path, as_version=4)
    nbformat.validate(nb)
    slides = path.parent.parent / "slides"
    if write and not slides.is_dir():
        raise ValueError(f"Existing slides directory required: {slides}")
    with tempfile.TemporaryDirectory(prefix="mpc-notebook-") as directory:
        client = NotebookClient(nb, timeout=300, kernel_name="python3",
                                resources={"metadata": {"path": directory}})
        km = client.create_kernel_manager()
        km.kernel_spec.argv = [sys.executable, "-m", "ipykernel_launcher", "-f", "{connection_file}"]
        client.execute()
        if write:
            nbformat.write(nb, path)
            for figure in (Path(directory) / "figures").glob("*.png"):
                shutil.copy2(figure, slides / figure.name)
    print(f"PASS {path.relative_to(ROOT)}", flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("paths", nargs="*", type=Path)
    parser.add_argument("--write", action="store_true", help="Save executed notebook and figures")
    args = parser.parse_args()
    if args.write and not args.paths:
        parser.error("--write requires explicit notebook paths")
    paths = [p.resolve() for p in args.paths] or sorted(ROOT.glob("chapter*/examples/chapter*.ipynb"))
    if not paths:
        raise SystemExit("No chapter notebooks found")
    for path in paths:
        run(path, args.write)


if __name__ == "__main__":
    main()
