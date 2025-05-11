# 🧪 Swag Labs - Testes Automatizados com Robot Framework

Este repositório contém testes automatizados para o site [Swag Labs](https://www.saucedemo.com/) utilizando o **Robot Framework** com **SeleniumLibrary**.
[Link para vídeo aula no Youtube que utilizei para melhor compreensão](https://www.youtube.com/watch?v=wdtqpQrQ598&list=PL5ipcSFH2tk8RWxtvuaOK-qpdAvlWkSoo)

## 🛠️ Ferramentas Utilizadas

* [Python 3.x](https://www.python.org/)
* [Robot Framework](https://robotframework.org/)
* [Robot Framework SeleniumLibrary](https://github.com/robotframework/SeleniumLibrary)
* [Google Chrome](https://www.google.com/chrome/) ou [Mozilla Firefox](https://www.mozilla.org/firefox/)
* [VS Code](https://code.visualstudio.com/) com extensões recomendadas

---

## 📦 Instalação Passo a Passo

### 1. Instale o Python

Acesse: [https://www.python.org/downloads](https://www.python.org/downloads)
Baixe e instale a versão mais recente (recomenda-se marcar a opção **"Add Python to PATH"** durante a instalação).

---

### 2. Instale o pip (se ainda não estiver incluso)

Verifique com:

```bash
pip --version
```

Se não estiver instalado, siga este guia: [https://pip.pypa.io/en/stable/installation/](https://pip.pypa.io/en/stable/installation/)

---

### 3. Clone este repositório

Abra o terminal (cmd, PowerShell ou terminal do VS Code) e execute:

```bash
git clone https://github.com/Practicing-test-automation-with-robot/swag-labs-tests.git
```

Acesse a pasta:

```bash
cd swag-labs-tests
```

---

### 4. Crie e ative um ambiente virtual (opcional, mas recomendado)

```bash
python -m venv venv
```

No Windows:

```bash
venv\Scripts\activate
```

No macOS/Linux:

```bash
source venv/bin/activate
```

---

### 5. Instale as dependências

```bash
pip install -r requirements.txt
```

Caso o arquivo `requirements.txt` não exista, instale manualmente:

```bash
pip install robotframework selenium robotframework-seleniumlibrary
```

---

### 6. Execute os testes

```bash
robot tests/
```

---

## 💻 Extensões recomendadas para VS Code

Abra o VS Code e instale:

* **Robot Framework Language Server**

  > Suporte completo a sintaxe e execução de testes

* **Python** (oficial da Microsoft)

  > Necessário para lint e depuração

* **Pylance**

  > Sugestões e melhorias de performance

Para instalar, vá em `Extensões (Ctrl+Shift+X)` e busque pelos nomes acima.

---

## 📁 Organização das Pastas

```bash
swag-labs-tests/
├── tests/              # Casos de teste organizados por funcionalidades
│   └── login_tests.robot
├── resources/          # Arquivos de recursos compartilhados
│   └── keywords.robot
│   └── locators.robot
├── results/            # Relatórios e evidências de execução
├── README.md           # Instruções do projeto
└── requirements.txt    # Dependências do projeto
```

---

## 🧪 Dica!

Você pode rodar testes específicos usando:

```bash
robot tests/login_tests.robot
```


