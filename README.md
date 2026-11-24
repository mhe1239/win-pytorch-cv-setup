# CV1

## 다른 컴퓨터에서 실행하기 (Windows)

Python 3.12와 VS Code의 Python, Jupyter 확장을 설치한 후, 저장소 폴더를 VS Code에서 엽니다. VS Code 터미널에서 다음 명령을 실행하세요.

```powershell
py -3.12 -m venv venv
.\venv\Scripts\python.exe -m pip install -r requirements.txt
```

노트북 오른쪽 위의 **커널 선택**에서 `venv`의 Python을 선택하세요. 패키지 설치에는 시간이 걸리고, 특히 PyTorch는 용량이 큽니다. `torchviz`로 그래프를 그리려면 별도로 Graphviz 프로그램을 설치하고 `dot` 명령이 PATH에 있어야 합니다.

GPU 사용 여부에 따라 PyTorch 설치 방법이 다를 수 있습니다. 위 명령은 기본 패키지를 설치합니다.
