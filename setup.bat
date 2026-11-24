@echo off
chcp 65001 >nul
cd /d "%~dp0"

:: 0. Python 3.12 확인 및 미설치 시 자동 설치
py -3.12 --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [0/5] Python 3.12가 없어 자동 설치를 진행합니다...
    winget install --id Python.Python.3.12 -e --accept-source-agreements --accept-package-agreements
)

:: 1. 윈도우 Graphviz 시스템 프로그램 설치 (이미 설치되어 있으면 건너뜀)
echo [1/5] Graphviz 시스템 프로그램 확인 및 설치 중...
winget install --id Graphviz.Graphviz -e --accept-source-agreements --accept-package-agreements

:: 현재 배치 파일 세션에서도 바로 dot.exe를 인식할 수 있도록 임시 PATH 추가
set "PATH=%PATH%;C:\Program Files\Graphviz\bin"

:: 2. 가상환경 생성 및 활성화 (Python 3.12 명시)
echo [2/5] 가상환경 생성 및 활성화 중...
py -3.12 -m venv venv
call venv\Scripts\activate

:: 3. 패키지 일괄 설치
echo [3/5] 파이썬 패키지 설치 중...
python -m pip install --upgrade pip
pip install -r requirements.txt

:: 4. 주피터 커널 등록
echo [4/5] 주피터 커널 등록 중...
python -m ipykernel install --user --name=venv --display-name "CV_venv"

:: 5. 기본 임포트 코드가 포함된 1.ipynb 생성
echo [5/5] 1.ipynb 생성 중...
python -c "import json; nb = {'cells': [{'cell_type': 'code', 'execution_count': None, 'metadata': {}, 'outputs': [], 'source': ['import torch\n', 'import torchvision\n', 'from torchinfo import summary\n', 'from torchviz import make_dot\n']}], 'metadata': {}, 'nbformat': 4, 'nbformat_minor': 5}; open('1.ipynb', 'w', encoding='utf-8').write(json.dumps(nb, indent=2))"

:: 6. 원본 템플릿 깃허브 연결 자동 해제
if exist .git rmdir /s /q .git

echo.
echo [완료] Graphviz 설치, 가상환경 세팅, 1.ipynb 생성 및 템플릿 Git 연결 해제가 끝났습니다!
echo * 주의: VS Code가 이미 켜져 있었다면 Graphviz PATH 인식을 위해 VS Code를 재시작하세요.
pause