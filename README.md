# Flutter Application - Login, IMC Calculator, and User Info

## 📋 Descrição do Projeto

Este projeto consiste em uma aplicação Flutter desenvolvida com o padrão **MVC**. A aplicação possui funcionalidades de autenticação, cálculo de IMC e exibição de informações pessoais. As principais características incluem validação de entradas com **Validatorless**, armazenamento local com **SQLite** e design baseado em Material Design.

---

## 📂 Estrutura do Projeto

- **Padrão de Arquitetura:** MVC (Model-View-Controller).
- **Banco de Dados:** SQLite para armazenamento local.
- **Design:** Tela de login e telas secundárias seguindo Material Design.
- **Funcionalidades:**
  - Tela de Login com validação.
  - Cadastro e armazenamento seguro de credenciais no banco local.
  - Cálculo de IMC exibindo:
    - Nome da pessoa.
    - Peso relativo com base na altura.
  - Tela com informações pessoais:
    - Nome.
    - Semestre.
    - Pequena descrição.

---

## 🚀 Funcionalidades Principais

### 1. **Tela de Login**
- Validações de campos obrigatórios.
- Armazenamento seguro das credenciais no banco local usando **SQLite**.
- Redirecionamento após login bem-sucedido.

### 2. **Tela de Calculadora de IMC**
- Entrada de peso e altura do usuário.
- Cálculo do **IMC** utilizando a fórmula:  
  \[
  \text{IMC} = \frac{\text{Peso (kg)}}{\text{Altura (m)}^2}
  \]

### 3. **Tela de Informações Pessoais**
- Exibição de:
  - Nome do desenvolvedor.
  - Semestre atual.
  - Uma breve descrição pessoal.

---

## 🛠️ Tecnologias Utilizadas

- **Linguagem:** Dart.
- **Framework:** Flutter.
- **Armazenamento Local:** SQLite.
- **Design:** Material Design.


## 📦 Configuração do Projeto

### 1. **Clonar o Repositório**
```bash
git clone https://github.com/seu-usuario/nome-do-projeto.git
cd nome-do-projeto

flutter pub get

flutter run
``` 
