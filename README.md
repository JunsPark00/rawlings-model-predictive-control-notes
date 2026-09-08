# Study Notes for Model Predictive Control: Theory, Computation, and Design

Rawlings, Mayne, Diehl — 2nd edition, 1st printing (2017).
원본 교재의 장·절 순서를 따르는 비공식 학습 자료입니다. 현재 한국어 자료를 제공하며 영어 자료는 추후 추가할 예정입니다.

**Made by Codex**

이 저장소의 설명·코드·슬라이드는 OpenAI Codex의 도움으로 제작되었습니다. **수식, 번역, 해설, 코드 및 실행 결과에 오류나 누락이 있을 수 있습니다.** 실행 검증을 통과했더라도 이론의 정확성이나 모든 환경에서의 동작을 보장하지 않습니다. 원본 교재와 대조하고 중요한 계산은 독립적으로 확인해 주세요. 오류는 GitHub Issues로 제보해 주세요.

이 프로젝트는 저자·출판사와 무관한 비공식 학습 노트이며, 공식 번역본이나 공식 해설서가 아닙니다.

## 원본 교재

Rawlings, Mayne, Diehl, *Model Predictive Control: Theory, Computation, and Design*, 2nd edition, 1st printing (2017)을 기준으로 합니다.

- [저자 공식 교재 사이트 및 다운로드](https://sites.engineering.ucsb.edu/~jbraw/mpc/)
- [공식 PDF — 2판 1쇄](https://sites.engineering.ucsb.edu/~jbraw/mpc/MPC-book-2nd-edition-1st-printing.pdf)

**원본 책 PDF는 이 저장소에 포함하지 않습니다.** 공식 사이트에서 받아 주세요. 저장소의 `chapter*/slides/*.pdf`는 별도로 제작한 한글 학습 슬라이드입니다. 원본 교재의 저작권은 권리자에게 있으며, 출처 표시는 원문·그림의 자유로운 재배포 허락을 의미하지 않습니다.

## 학습 자료

`chapter01_...`부터 `chapter08_...`까지의 폴더를 사용합니다.
**전체 1–8장의 한글 PPT·PDF와 챕터별 노트북을 제공합니다.** 각 장은 원본 교재의 절·하위 절 순서를 따릅니다.

공개된 노트북은 아래 Colab 버튼으로 열 수 있습니다. 코드 실행에는 Google 계정 로그인이 필요할 수 있습니다.

| 장 | 내용 | 자료 | 실습 |
|---|---|---|---|
| 1 | MPC 시작하기 | [안내](chapter01_getting_started/README.md) · [PPT](chapter01_getting_started/slides/chapter01_slides.pptx) · [PDF](chapter01_getting_started/slides/chapter01_slides.pdf) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JunsPark00/rawlings-model-predictive-control-notes/blob/main/chapter01_getting_started/examples/chapter01.ipynb) |
| 2 | MPC 조절 | [안내](chapter02_mpc_regulation/README.md) · [PPT](chapter02_mpc_regulation/slides/chapter02_slides.pptx) · [PDF](chapter02_mpc_regulation/slides/chapter02_slides.pdf) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JunsPark00/rawlings-model-predictive-control-notes/blob/main/chapter02_mpc_regulation/examples/chapter02.ipynb) |
| 3 | 강인·확률적 MPC | [안내](chapter03_robust_stochastic_mpc/README.md) · [PPT](chapter03_robust_stochastic_mpc/slides/chapter03_slides.pptx) · [PDF](chapter03_robust_stochastic_mpc/slides/chapter03_slides.pdf) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JunsPark00/rawlings-model-predictive-control-notes/blob/main/chapter03_robust_stochastic_mpc/examples/chapter03.ipynb) |
| 4 | 상태 추정 | [안내](chapter04_state_estimation/README.md) · [PPT](chapter04_state_estimation/slides/chapter04_slides.pptx) · [PDF](chapter04_state_estimation/slides/chapter04_slides.pdf) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JunsPark00/rawlings-model-predictive-control-notes/blob/main/chapter04_state_estimation/examples/chapter04.ipynb) |
| 5 | 출력 피드백 MPC | [안내](chapter05_output_mpc/README.md) · [PPT](chapter05_output_mpc/slides/chapter05_slides.pptx) · [PDF](chapter05_output_mpc/slides/chapter05_slides.pdf) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JunsPark00/rawlings-model-predictive-control-notes/blob/main/chapter05_output_mpc/examples/chapter05.ipynb) |
| 6 | 분산 MPC | [안내](chapter06_distributed_mpc/README.md) · [PPT](chapter06_distributed_mpc/slides/chapter06_slides.pptx) · [PDF](chapter06_distributed_mpc/slides/chapter06_slides.pdf) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JunsPark00/rawlings-model-predictive-control-notes/blob/main/chapter06_distributed_mpc/examples/chapter06.ipynb) |
| 7 | 명시적 제어 | [안내](chapter07_explicit_control/README.md) · [PPT](chapter07_explicit_control/slides/chapter07_slides.pptx) · [PDF](chapter07_explicit_control/slides/chapter07_slides.pdf) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JunsPark00/rawlings-model-predictive-control-notes/blob/main/chapter07_explicit_control/examples/chapter07.ipynb) |
| 8 | 수치 최적 제어 | [안내](chapter08_numerical_optimal_control/README.md) · [PPT](chapter08_numerical_optimal_control/slides/chapter08_slides.pptx) · [PDF](chapter08_numerical_optimal_control/slides/chapter08_slides.pdf) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JunsPark00/rawlings-model-predictive-control-notes/blob/main/chapter08_numerical_optimal_control/examples/chapter08.ipynb) |

Colab 버튼을 누르고 `런타임 → 모두 실행`을 선택하세요. 노트북마다 마크다운 대제목·하위 제목으로 교재 절을 구분하고 한글 설명·수식·실습·결과 해석을 제공합니다.
교재 사례와 직접 설계한 보충 실습은 각 자료에 구분해 표시합니다. 전체 연습문제 해답을 포함하지 않습니다.

**1장 품질 보강:** 원본 pp.1–88과 대조해 초기조건·분포 모델·제약·MHE 도착 비용·반응기 외란 모델 설명을 확장했습니다. 한글 슬라이드 62쪽, 그래프 19개, 검증 지표 24개를 제공하며 [1장 안내](chapter01_getting_started/README.md)에 원본 대응표와 재생성 방법을 정리했습니다.

**2장 품질 보강:** 원본 QP 사례·비선형 허용 입력·종단 불변 다각형·경제적 비용 보정·반올림 반례를 추가했습니다. 한글 슬라이드 63쪽, 그래프 19개, 검증 지표 30개입니다. [2장 안내](chapter02_mpc_regulation/README.md)에 원본 p.100의 비용 수치 불일치도 기록했습니다.

**3장 품질 보강:** 원본 피드백 비교와 Example 3.13의 2차원 제약 축소를 재현하고, 정보 순서·모델 오차·확률 검증 실습을 추가했습니다. 한글 슬라이드 61쪽, 그래프 18개, 검증 지표 39개입니다. [3장 안내](chapter03_robust_stochastic_mpc/README.md)에 원본 대응과 재생성 방법을 정리했습니다.

**4장 품질 보강:** 도착 비용의 과거 변수 제거, 제약 추정의 기하, 원본 반응기 모델, 모멘트·입력 이력 비교를 추가했습니다. 한글 슬라이드 52쪽, 그래프 19개, 검증 지표 42개입니다. [4장 안내](chapter04_state_estimation/README.md)에 재현 범위와 재생성 방법을 정리했습니다.

**5장 품질 보강:** 관측기 이득·결합 오차 도달 집합·외란 식별 조건·목표 가능 영역·입력 비용 중심 비교를 추가했습니다. 한글 슬라이드 47쪽, 그래프 15개, 검증 지표 40개입니다. [5장 안내](chapter05_output_mpc/README.md)에서 실험의 가정과 결과를 확인할 수 있습니다.

**6장 품질 보강:** 원본 예제 6.9–6.12의 반복·폐루프·목표 계산을 재현하고, 6.22의 비선형 초기 비용을 분석했습니다. 한글 슬라이드 64쪽, 그래프 21개, 검증 지표 52개입니다. [6장 안내](chapter06_distributed_mpc/README.md)에 원본 재현 범위와 해석을 정리했습니다.

**7장 품질 보강:** 원본 예제 7.11·7.12를 재현하고 비용의 미분·퇴화, LP 정규화, 첫 입력 식 재사용을 추가했습니다. 한글 슬라이드 53쪽, 그래프 17개, 검증 지표 38개입니다. [7장 안내](chapter07_explicit_control/README.md)에 원본 연결과 재생성 방법을 정리했습니다.

**8장 품질 보강:** 원본 비선형 MPC·적분·뉴턴·자동 미분 예제를 연결하고, 단순 포화와 제약 최적화의 비용 차이를 추가했습니다. 한글 슬라이드 98쪽, 그래프 25개, 검증 지표 70개입니다. [8장 안내](chapter08_numerical_optimal_control/README.md)에 재현 범위와 실행 방법을 정리했습니다. 본문 마지막 8장까지 품질 보강을 마쳤습니다.

## 폴더 구성

예를 들어 제6장은 다음과 같습니다.

```text
chapter06_distributed_mpc/
├── README.md
├── examples/
│   └── chapter06.ipynb
└── slides/
    ├── chapter06_slides.pptx
    ├── chapter06_slides.pdf
    └── 실습 그래프 PNG 파일들
```

`slides/`의 PDF는 한글 학습 슬라이드이며, 편집 원본은 PPT입니다.
각 장의 한글 설명·실습은 하나의 노트북에 통합되어 있습니다.

## 실행

전체 1–8장은 챕터별 노트북 하나로 실행합니다.
README의 Colab 버튼을 누르거나 각 `examples/chapterNN.ipynb`를 Jupyter에서 열고 위에서 아래로 실행하세요.
최초 실행에는 패키지와 한글 글꼴 다운로드를 위한 인터넷이 필요합니다.

로컬 환경을 설정하려면:

```bash
bash setup.sh
```

전체 실행은 다음과 같습니다. 개편한 챕터는 노트북을 한 번씩 실행하고 결과를 저장합니다.
노트북 출력은 `examples/`의 원본에 저장하고 생성한 그림은 기존 `slides/`에 갱신합니다.
총 8개의 챕터 노트북을 순서대로 실행합니다.

```bash
bash run_all.sh
```

## 검증과 PDF 갱신

모든 개편 노트북을 빈 임시 폴더에서 검증합니다. 이 명령은 저장된 노트북·그림을 수정하지 않습니다.

```bash
python -m pip install -r requirements-colab.txt nbformat nbclient ipykernel
python tools/check_notebooks.py
```

PPT를 수정한 후 Windows PowerPoint로 같은 `slides/` 폴더의 PDF를 갱신할 수 있습니다.

```powershell
powershell -ExecutionPolicy Bypass -File tools/export_pdf.ps1 -Pptx chapter06_distributed_mpc/slides/chapter06_slides.pptx
```

노트북 실행만으로 PPT·PDF가 자동 갱신되지는 않습니다. 실습 설정을 바꾸면 그림·설명·수치를 PPT에 반영한 뒤 PDF를 내보내세요.

## 참고 문헌

Rawlings, J. B., Mayne, D. Q., Diehl, M. (2017). *Model Predictive Control: Theory, Computation, and Design*. 2nd edition, 1st printing. Nob Hill Publishing.
