# PyTorch Computer Vision Environment Setup (Windows)

Windows 환경에서 PyTorch(CUDA 12.8) 기반 컴퓨터 비전(CV) 개발 및 모델 시각화(`torchviz`) 환경을 구축하는 레포지토리입니다.

## 포함된 구성
- **System App:** Graphviz (`winget` 자동 설치)
- **Python Packages:** `torch`, `torchvision` (cu128), `torchinfo`, `torchviz`, `graphviz`, `numpy`, `pandas`, `scikit-learn`, `matplotlib`, `tqdm`, `ipykernel`, `ipywidgets`
- **Jupyter Setup:** `CV_venv` 커널 등록 및 기본 임포트가 포함된 `1.ipynb` 생성

## 1. 프로젝트 가져오기 (Clone)

세팅을 원하는 **비어 있는 프로젝트 폴더**에서 터미널을 열고 아래 명령어를 실행합니다.

```powershell
# 현재 폴더 위치에 바로 파일 복사 (끝의 마침표 '.' 포함)
git clone https://github.com/mhe1239/win-pytorch-cv-setup.git .
```
## 2.기본 환경 셋팅

```powershell
# python
winget install --id Python.Python.3.12 -e --accept-source-agreements --accept-package-agreements
# vscode
winget install --id Microsoft.VisualStudioCode -e --source winget
# docker
winget install --id Docker.DockerDesktop -e --source winget
# github cli
winget install --id GitHub.cli -e --source winget
```

### Visual Studio 2022
```powershell
# C/C++
winget install --id Microsoft.VisualStudio.2022.Community -e --source winget
```

## 설치 및 실행 방법 (택 1)

### 방법 1: 원클릭 전체 자동 세팅 (추천)
가상환경 생성, 패키지 설치, Graphviz 앱 설치, Jupyter 커널(`CV_venv`) 등록, `1.ipynb` 생성을 한 번에 처리합니다.

1. 이 레포지토리를 클론하거나 ZIP으로 다운로드합니다.
2. 폴더 내의 **`setup.bat`** 파일을 더블클릭(또는 터미널에서 `.\setup.bat`)하여 실행합니다.
3. 설치 완료 후 **VS Code를 재시작**한 뒤 `1.ipynb` 우측 상단 커널에서 **`CV_venv`**를 선택합니다.

---

### 방법 2: 터미널에서 파이썬 패키지만 수동 설치
이미 Graphviz가 설치되어 있거나, 특정 파이썬 버전(예: 3.12)으로 패키지 설치만 빠르게 진행하고 싶을 때 사용합니다.

pytorch셋팅
```powershell
# 1. 가상환경 생성 (Python 3.12 지정)
py -3.12 -m venv venv

# 2. requirements.txt 패키지 일괄 설치
.\venv\Scripts\python.exe -m pip install -r requirements.txt
winget install --id GitHub.GitHubDesktop -e --source winget
# 4. 원본 템플릿 GitHub 저장소 연결 끊기
Remove-Item -Recurse -Force .git -ErrorAction SilentlyContinue
```