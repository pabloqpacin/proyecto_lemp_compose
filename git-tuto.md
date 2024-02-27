# GITEANDO

> amoallá!


- [GITEANDO](#giteando)
  - [Git - Primer repositorio local](#git---primer-repositorio-local)
    - [Intro](#intro)
    - [Primera commit](#primera-commit)
    - [Mínimo `.gitconfig`](#mínimo-gitconfig)
    - [Primera y segunda commits](#primera-y-segunda-commits)
  - [Github - Primer repositorio remoto](#github---primer-repositorio-remoto)
    - [PREÁMBULO](#preámbulo)
    - [1 - Crear repo remoto (GITHUB)](#1---crear-repo-remoto-github)

## Git - Primer repositorio local

### Intro

```bash
# > Abre sesión tmux

# Si existe .gitconfig y es un symlink de mis dotfiles, elimínalo
if [ -L ~/.gitconfig ]; then
  rm ~/.gitconfig
fi

# Comprueba que git está instalado
git --version

# Si no, instala git en Linux (Debian-based distro)
sudo apt-get update && sudo apt-get install -y git

# # O instala git en Windows
# winget install git.git

# Crea el directorio REPOS para guardar varios proyectos
mkdir ~/repos
```

### Primera commit

```bash
# Crea el directorio PRIMER-REPO para esta demo y cd al último argumento del comando anterior
mkdir -p ~/repos/primer-repo && cd $_

# Inicializa un repositorio local
git init

# > Ojo tema zsh: chivato estado git

# > Abre panel tmux para (*) más abajo
```
```bash
# Comprueba el estado (limpio)
git status

# Crea un documento y añádele una línea
echo "# Mi primer repo" > README.md

# Comprueba el estado (sucio)
git status

# Añade el archivo en su versión actual al control de versiones de Git (STAGING AREA)
git add README.md

# Comprueba el estado (ready)
git status

# Edita el archivo
echo -e "\nBuenardas" >> README.md

# Comprueba el estado (ready + sucio)
git status

# Añade (stage) todos los cambios del repositorio
git add . || git add -A

# Comprueba el estado (ready)
git status

# PRIMERA COMMIT -- Siempre se necesita un mensaje
git commit -m "Initial commit"

########
# FAIL #
########

# > Abre panel tmux para (**) más abajo
```

<!-- [*] -->

### Mínimo `.gitconfig`

```bash
# > Abre panel tmux (*)

# Mira a ver si existe ~/.gitconfig
ls -la ~/.gitconfig

# Renombra la rama por defecto de MASTER a MAIN
git config --global init.defaultBranch main

# Mira a ver si existe ~/.gitconfig
ls -la ~/.gitconfig
bat ~/.gitconfig || cat ~/.gitconfig

# Renombra la branch en PRIMER-REPO
git branch -m master main

# > Cierra panel tmux (*)
```
```bash
# > Abre panel tmux (**)

# Dile a git quién eres
git config --global user.name "$USER"
git config --global user.email $USER@example.com              # El de Github...

# Consulta de nuevo el .gitconfig
bat ~/.gitconfig

# # Date cuenta de que si este archivo lo importas de forma programática, se acaba antes

# # Crea tu repo de dotfiles tuyos y ponle el .gitconfig, márcate un symlink -- Podrías hacer lo mismo con el .zshrc.bak de oh-my-zsh
# $ mkdir ~/my-dotfiles && mv ~/.gitconfig ~/my-dotfiles && ln -s ~/my-dotfiles/.gitconfig ~/ && git init ~/my-dotfiles

# # En el futuro podrías importarlo/clonarlo en una nueva vm u otro sistema en general
# $ git clone <...>/my-dotfiles.git && ln -s ~/my-dotfiles/.gitconfig ~/

# > https://git-scm.com/book/es/v2/Inicio---Sobre-el-Control-de-Versiones-Configurando-Git-por-primera-vez
```

### Primera y segunda commits

```bash
# PRIMERA COMMIT -- Siempre se necesita un mensaje
git commit -m "Initial commit"

# Comprueba el estado (limpio)
git status

# Revisa el histórico
git log || glod

  # $ alias glol
  # glol='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"'

# Edita el archivo
echo -e "\n\nTaluego" >> README.md

# Léelo con BAT -- Date cuenta de la integración con git...
bat README.md

# Comprueba el estado (sucio)
git status || gst

# Mira las diferencias
git diff

# Añade el archivo al staging area
git add README.md

# Comprueba el estado (ready)
git status  # && bat README.md

# Mira las diferencias con respecto a la última commit
git diff --staged

# OTRA COMMIT
git commit -m "Update README"

# Revisa el histórico
git log -stat || glols

# > Merece la pena echar un vistacillo a los atajos de ohmyzsh que podemos habilitar en nuestro .zshrc... -- https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
```

![infografia_areas](https://res.cloudinary.com/practicaldev/image/fetch/s--M_fHUEqA--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://thepracticaldev.s3.amazonaws.com/i/128hsgntnsu9bww0y8sz.png)

---

> WIP


## Github - Primer repositorio remoto

### PREÁMBULO

1. Se recomienda:
   - Linux
   - WSL
   - VS Code
   - OhMyZsh (~~bash shell~~)
2. NOTAS:
   - se puede usar Git de forma local exclusivamente; no hace falta Github
   - Github permite compartir un repo local con el mundo
     - permitiendo que todo el mundo pueda VER y PARTICIPAR (incluso COPIAR...)
     - pero sin permitirles MODIFICAR tu repo sin tu CONSENTIMIENTO
3. Introducción:
   - En la imagen, todos los puntos son VERSIONES de un mismo REPOSITORIO (conjunto de archivos, directorio)
     - `MASTER`: VERSIÓN o rama (BRANCH) original, principal; rama común, siempre visible
     - `YOUR-WORK`: otra rama o VERSIÓN del repo; no interfiere con `MASTER` y luego se juntan (via `merge` o `Pull Request`)
     - `SEW`: igual, otra rama; ramas puede haber infinitas, bajo cualquier nombre

![infografia_ramas](https://www.nobledesktop.com/image/gitresources/git-branches-merge.png)


### 1 - Crear repo remoto (GITHUB)
- [ ] Crear cuenta

<!--

- [ ] Nuevo repo
  - [ ] añadir LICENCIA
  - [ ] crear repo


## 2 - Config global + crear repo local (GIT)

### 2.1 - Verificar GIT y "config global"

- [x] Verificar que GIT está instalado: `git --version`
- [ ] Mirar 'config global' actual: `git config --list`
  - [ ] config usuario: `git config --global user.name "TuNombre"`
  - [ ] config email: `git config --global user.email aquí@tu.correo`
- [ ] Verificar: `git config -l`

### 2.2 - Crear repo
- [ ] Ir a directorio deseado: `mkdir ~/GITEANDO/segundoRepo && cd "$_"`
- [ ] Inicializar git: `git init`
- [ ] Consultar estado: `git status`
- [ ] RENOMBRAR BRANCH/RAMA: `git branch -m main`



## 3 - Sincronizar local con remoto (Github + Git) 
- [ ] Vuelve a Github y abre tu repo; encuentra el **código para clonar** (HTTPS... o SSH si te atreves)
- [ ] Entrega el código en el repo local: `git remote add origin <...>`
- [ ] Actualizar local con info remota (de BRANCH 'main'): `git fetch`
- [ ] Importar archivos de BRANCH remota: `git pull origin main`
- [ ] Verificar local: `git status`


### 4 - Modificar local & actualizar remoto (Git + Github)

> Básicamente, CONTROL DE VERSIONES

- [ ] Crea y edita archivos; guarda los cambios
```bash
# Crea varios archivos, por ejemplo:
touch unReadme.md
echo "un archivo normal" > archivoNormal.txt
echo "<?xml version='1.0' encoding='UTF-8' ?>" > archivoXML.xml
echo "Esto será un secreto" > .env
echo -e "# Esto protegerá el secreto \n.env" > .gitignore 
```

- [ ] Fíjate como el `.gitignore` OCULTA archivos sensibles 
- [ ] Añade los archivos al "escáner" que es git: `git add .`
- [ ] Consulta estado: `git status`
- [ ] **Guarda copia local**: `git commit -m "ESTOS ARCHIVOS HACEN ESTO"` (*)
- [ ] Manda copia local a BRANCH remota: `git push --set-upstream origin main`
  - ojo, la primera vez es así largo; una vez las BRANCHES se sincronizan: `git push`



```bash
# (*) Mejor ejemplo de mensaje de commit
# Siempre puedes copiar y pegar del editor,
# en lugar de escribir "incómodamente" en la terminal
git commit -m "ESTOS ARCHIVOS HACEN ESTO


- archivo.01: hace tal
- archivo.02: hace cual"
```

### 5 - Manejando BRANCHES
- [ ] Ten tu repo limpio (verde): `git status`
- [ ] Crea nueva rama, y cambia a ella: `git checkout -b nuevaBranch`
- [ ] Ahora podrías hacer igual en rama/repo local: editar, guardar, `add`, `commit`
- [ ] Para subir NUEVA rama a Github: `git push -u origin nuevaBranch`
- [ ] Cambia a la BRANCH principal: `git checkout main`
- [ ] Puedes volcar la NUEVA en la principal: `git merge nuevaBranch`


---

<!-- [*] -->

---


```bash
# Elimina "lo sucio" (cambios no añadidos)
git restore README.md

# Deshace el staging (con respecto a HEAD), si no hay commits el archivo se vuelve Untracked
git reset README.md
```