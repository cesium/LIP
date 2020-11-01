# Linux Installation Party 2020

# Bem-vindo à Linux Installation Party 2020!

---

Este guia vai-te ajudar a instalar o Ubuntu em *dual boot* com o Windows 10, ou seja, poderás usar usar qualquer um dos dois sistemas operativos, consoante o que precisares mais.

---

⚠️ **Se tens um Mac, este guia não é para ti!**

Os utilizadores de macOS não precisam de instalar uma distribuição de Linux.

---

⚠️ Antes de começares, certifica-te que:

- tens um backup dos teus dados;
- tens uma pen de, pelo menos, 4GB;
- tens o computador ligado à corrente;
- tens um telemóvel ou outro computador à mão onde possas seguir este guia e comunicar connosco no Discord, se precisares.

---

# 🆘 Como te vamos ajudar

Durante esta semana, tentaremos ter sempre gente que te possa ajudar no [**Discord de MIEI**](https://discord.gg/m3kVwYM), **das 11h às 20h**.

[Join the MiEI Discord Server!](https://discord.gg/m3kVwYM)

⚠️⚠️ **Sempre que tiveres alguma dúvida ou não percebas alguma coisa em qualquer parte deste guia, podes ir ao Discord e expor as tuas dúvidas no channel #help-desk** ⚠️⚠️

---

# 👨‍💻 Recursos extra

Podes complementar este guia com alguns destes recursos extra:

USB de instalação: [https://ubuntu.com/tutorials/create-a-usb-stick-on-windows#1-overview](https://ubuntu.com/tutorials/create-a-usb-stick-on-windows#1-overview)

Desativar secure boot: [https://fossbytes.com/enable-disable-secure-boot-windows-8-10/](https://fossbytes.com/enable-disable-secure-boot-windows-8-10/)

Processo de instalação do Ubuntu: [https://itsfoss.com/install-ubuntu-1404-dual-boot-mode-windows-8-81-uefi/](https://itsfoss.com/install-ubuntu-1404-dual-boot-mode-windows-8-81-uefi/)

Sobre partições do Ubuntu: [https://help.ubuntu.com/community/DiskSpace](https://help.ubuntu.com/community/DiskSpace)

---

# 💾 Criar um USB de instalação do Ubuntu

---

Para instalar o Ubuntu, vamos criar uma pen USB inicializável.

### Download do ISO

Faz o download da imagem do Ubuntu 20.04:

[https://ubuntu.com/download/desktop](https://ubuntu.com/download/desktop)

### Instalar o Balena Etcher

Instala o Balena Etcher:

[https://www.balena.io/etcher/](https://www.balena.io/etcher/)

Este é o programa que vai fazer o *flash* do ISO na pen.

### *Flash* do ISO para a pen

1. Coloca a pen USB no PC.

    ⚠️ **Cerfifica-te que a pen não tem dados importantes, pois vai ser formatada pelo Etcher**

2. Abre o Balena Etcher
3. No primeiro campo, seleciona o ISO do Ubuntu
4. No segundo campo, confirma que a pen apresentada é onde pretendes flashar o Ubuntu. Se não for, seleciona a que pretendes.
5. Clica em **Flash!**

![Linux%20Installation%20Party%202020/Untitled.png](Linux%20Installation%20Party%202020/Untitled.png)

Após alguns minutos, a pen estará pronta! Podes mantê-la ligada ao PC.

# 🔓 Desativar a encriptação

---

⚠️ Alguns computadores mais recentes vêm encriptados de fábrica. Instalar o Ubuntu sem desativar a encriptação causa o bloqueio do Windows, até que seja efetuado o processo de desencriptação. Este processo é moroso e pode não ser possível, caso não se saibam algumas credenciais (já aconteceu!), levando à perda total dos dados.

### Passos para verificar a desencriptação

1. Abre o **Menu Iniciar**;
2. Seleciona **Definições** ⚙️
3. Escolhe **Atualizações e Segurança**
4. Procura **Encriptação de dispositivo** na coluna esquerda. Se a opção não for apresentada, significa que não está disponível e podes passar para a próxima parte.
5. Se a encontrares, clica nela e, depois, clica em **Desativar**

# 🖥️ Criar a partição

---

Temos de criar uma nova partição onde instalar o Ubuntu.

### Passos:

1. Abre o **Menu Iniciar**;
2. Seleciona **Definições** ⚙️
3. Na barra de pesquisa, escreve "**partições**" e clica na opção "**Criar e formatar partições do disco rígido**"
4. **Seleciona a partição que queres reduzir**, serão precisos entre 50 a ♾️GB.

    ⚠️ Este passo difere consoante o teu computador. Geralmente, reduzimos a partição com a letra **C:**, mas isto pode diferir o teu caso. Em caso de dúvidas, pergunta-nos no Discord!

5. Clica com o botão direito para abrires o menu e clica em **Reduzir Volume**

    ![Linux%20Installation%20Party%202020/Untitled%201.png](Linux%20Installation%20Party%202020/Untitled%201.png)

6. **Insere o valor a reduzir**, em *megabytes.*
    - 1 gigabyte = 1000 megabytes
    - O valor a reduzir pode ser entre 50 a infinitos GB, dependendo de quanto espaço possas/queiras dedicar ao Ubuntu. Geralmente, **recomendamos 100-120GB**, mas dá para instalar com apenas 50GB (se bem que podes a vir a ter problemas de falta de espaço no futuro, conforme instalas programas e crias ficheiros)

    ![Linux%20Installation%20Party%202020/Untitled%202.png](Linux%20Installation%20Party%202020/Untitled%202.png)

7. Clica em **Reduzir**
8. Ficas com algo assim:

![Linux%20Installation%20Party%202020/Untitled%203.png](Linux%20Installation%20Party%202020/Untitled%203.png)

É no espaço não atríbuido onde vamos instalar o Ubuntu.

# 🏃 Desativar o *fast boot*

---

Para ligar mais rápido, o Windows tem uma função chamada ***fast boot***. Para podermos fazer o *dual boot*, temos de desativar esta função.

### Passos:

1. Abre o **Menu Iniciar**;
2. Seleciona **Definições** ⚙️
3. Na barra de pesquisa, escreve "**energia**" e clica na opção "**Definições de energia e suspensão**"
4. Em **Definições relacionadas**, clica em **Definições adicionais de energia**.
5. Na coluna do lado esquerdo, escolhe a opção **escolher o que fazem os botões para ligar/desligar**.
6. Clica em 🛡️**Alterar definições que estão atualmente indisponíveis**
7. Em **Definições de encerramento**, desativa a opção **Ativar arranque rápido**

![Linux%20Installation%20Party%202020/Untitled%204.png](Linux%20Installation%20Party%202020/Untitled%204.png)

# 🔒 Desativar o *Secure Boot*

Esta é uma definição do UEFI (tradicionalmente chamado BIOS) e tem de ser desativada para permitir a instalação e utilização do Ubuntu.

⚠️ **Para facilitar passos futuros, certifica-te que tens a pen com o Ubuntu ligada ao PC antes de fazeres estes passos**

### Passos:

1. **Aceder ao UEFI:**
    1. Abre o **Menu Iniciar**
    2. Seleciona **Ligar/Desligar**
    3. Pressina o botão **Shift** ⬆️ e, mantendo-o pressionado, clica em **Reiniciar**

        Isto sinaliza que pretendemos um reinício avançado. Depois de clicares em reiniciar, podes largar o *shift*.

    4. Seleciona **Resolução de Problemas**
    5. Seleciona **Opções avançadas**
    6. Seleciona **Definições de firmware UEFI**
2. **No UEFI:**

    O ecrã da BIOS/UEFI e a localização das opções pode ser bastante diferente, dependendo do modelo do teu computador. Podes encontrar algo assim

    ![Linux%20Installation%20Party%202020/Untitled%205.png](Linux%20Installation%20Party%202020/Untitled%205.png)

    ou assim

    ![Linux%20Installation%20Party%202020/Untitled%206.png](Linux%20Installation%20Party%202020/Untitled%206.png)

    Terás de encontrar uma opção chamada **Secure Boot**. Terás de a encontrar sozinho, pois varia de PC para PC, mas geralmente costuma estar nas tabs **Security**, **Boot** ou **Advanced**.

    ![Linux%20Installation%20Party%202020/Untitled%207.png](Linux%20Installation%20Party%202020/Untitled%207.png)

    Se não encontrares nenhuma destas tabs (só acontece se tiveres uma interface UEFI como a da última imagem apresentada) então podes ter de entrar em **Modo Avançado** para te aparecerem. Deve haver um botão algures, procura!

    Quando encontrares a opção **Secure Boot**, clica no Enter e seleciona **Disabled**.

    ⚠️ **Não saias do UEFI, aidna vamos usar nos próximos passos.**

    # 🖥️ Boot do instalador do Ubuntu

    ---

    Nesta parte, ainda no UEFI, vamos configurar o PC para fazer o boot a partir da pen USB, para podermos ligar o instalador do Ubuntu.

    ⚠️ Mais uma vez, estes passos podem ser ligeiramente diferentes no teu caso.

    ### Passos:

    1. No UEFI, vai à tab **Boot**, deves encontrar uma lista chamada **Boot option priorities**

        Esta lista define a ordem de boot do teu PC, ou seja, o que é que ele deve inicializar até conseguir fazer boot.

    2. Na lista, deves encontrar uma ou duas listagens com o nome ou a marca da tua pen USB. Move-as para as primeiras prioridades. Dependendo do teu computador, podes fazer isto usando as teclas F5 e F6 ou abrindo as opções (com o Enter) e escolhendo o que pretendes. Tem atenção à legenda da UEFI para saberes como navegar.
    3. Deves ficar com algo deste género:

    ![Linux%20Installation%20Party%202020/Untitled%208.png](Linux%20Installation%20Party%202020/Untitled%208.png)

    Por fim, vai a **Exit** e seleciona **Exit saving changes**. O teu computador vai reiniciar e...

    # 🏆 Instalar o Ubuntu

    ---

    ### Passo 1:

    Em fez vez do tradicional inicío do Windows, vai-te aparecer algo assim:

    ![Linux%20Installation%20Party%202020/Untitled%209.png](Linux%20Installation%20Party%202020/Untitled%209.png)

    Deixa prosseguir até chegar a este ecrã:

    ![Linux%20Installation%20Party%202020/Untitled%2010.png](Linux%20Installation%20Party%202020/Untitled%2010.png)

    ⚠️ **Mantém a linguagem em Inglês**

    Quando eventualmente tiveres de ir pesquisar como fazer alguma coisa, vai ser muito mais fácil se o teu sistema operativo estiver em Inglês!

    Pressiona **Install Ubuntu.**

    ---

    ### Passo 2:

    **Escolhe o esquema do teu teclado**. Para teclados portugueses normais, as definições da imagem quase de certeza que dão.

    Podes sempre testar o teclado no espaço dedicado!

    Tech Tip: testa símbolos como **á**, **à**, **ã**, **ç**, **ã**, **!**, **%**, **/**, etc.

    ![Linux%20Installation%20Party%202020/Untitled%2011.png](Linux%20Installation%20Party%202020/Untitled%2011.png)

    Clica em **Continue**.

    ---

    ### Passo 3:

    **Liga-te ao Wi-Fi.** Se tiveres ligado por cabo ou o Ubuntu não detetar nenhum adaptador de rede, não verás este passo.

    ⚠️ O teu PC deve estar ligado à internet durante a instalação, pois será feito o download automático de drivers e atualizações importantes!

    Após estares ligado à internet, podes continuar.

    ---

    ### Passo 4:

    Mantém tudo como está, mas ativa a opção **Install third-party software for graphics and Wi-Fi hardware and additional media formats**.

    ![Linux%20Installation%20Party%202020/Untitled%2012.png](Linux%20Installation%20Party%202020/Untitled%2012.png)

    Podes clicar em **Continue**. Dependendo da velocidade do teu PC e da tua internet, a passagem deste passo para o próximo pode demorar um pouco.

    ---

    ### Passo 5:

    Para o tipo da instalação, escolhe **Something else** e continua.

    ![Linux%20Installation%20Party%202020/Untitled%2013.png](Linux%20Installation%20Party%202020/Untitled%2013.png)

    ---

    ### Passo 6:

    Vai-te ser apresentado um ecrã deste género:

    ![Linux%20Installation%20Party%202020/Untitled%2014.png](Linux%20Installation%20Party%202020/Untitled%2014.png)

    Dependendo das partições já existentes no teu computador, do tipo e quantidade de armazenamento que tens, a quantidade de linhas, o nome dos dispositivos e o seu tamanho podem ser diferentes.

    O importante, é identificares a partição que criaste logo no início, no passo 🖥️ **Criar a partição**

    Para isso, procura uma partição chamada **free space** que tenha aproximadamente o mesmo tamanho que a que criaste anteriormente e seleciona-a.

    ### Passo 6.1 - Criar a partição swap

    A partição **swap** é opcional e serve como um espaço em disco que complementa a RAM. O Linux utilizá-lo-á, principalmente, quando estiveres a ficar sem memória RAM, mas não só. Independentemente da quatidade de RAM que tenhas, é bastante importante criar esta partição.

    **Passos:**

    1. Com a partição correta selecionada, clica no **+**

        ![Linux%20Installation%20Party%202020/Untitled%2015.png](Linux%20Installation%20Party%202020/Untitled%2015.png)

    2. **Escolhe o tamanho da partição**

        O tamanho da partição é arbitrário e depende de quanto espaço tenhas. O que recomendamos é que escolhas o mesmo tamanho da memória RAM do teu PC (para permitir hibernação) ou, no mínimo, 8GB (mas pode ser menos, se tiveres mesmo muito pouco espaço disponível)

    3. **Insere as configurações**
        1. Multiplica o tamanho que escolheste para a partição (em GB) por 1000 e coloca-o no campo **Size**. (para 8GB, seria 8000MB)
        2. Seleciona as outras opções de acordo com a imagem

            ![Linux%20Installation%20Party%202020/Untitled%2016.png](Linux%20Installation%20Party%202020/Untitled%2016.png)

            e clica **OK**

    ### Passo 6.2 - Criar a partição root

    A partição **root** é onde o sistema operativo será instalado

    **Passos:**

    1. Seleciona a partição com o restante espaço livre (que sobrou depois da criação do swap) e clica em **+**
    2. Não precisas de alterar o **Size**, mas configura o resto das opções como estão na imagem

        ![Linux%20Installation%20Party%202020/Untitled%2017.png](Linux%20Installation%20Party%202020/Untitled%2017.png)

        e clica **OK.**

    Não deve ser necessário alterares o local de instalação do bootloader, por isso podes clicar em **Install Now**. Quando te aparecer o aviso, verifica as operações e carrega em **Continue**

    ---

    ### Passo 5:

    **Escolhe a tua localização.**

    Lisboa deve estar pré-selecionada, portanto podes clicar em **Continuar**.

    Isto é importante para a definição do fuso horário e outras definições baseadas em localização.

    ---

    ### Passo 6:

    **Preenche os teus dados.**

    1. No campo **Your name**, coloca o teu nome normal
    2. No campo **Your computer's name**, escolhe um nome pequeno, como a marca do teu computador
    3. Escolhe um nome de utilizador e uma password
    4. Clica em **Continue**

    ![Linux%20Installation%20Party%202020/Untitled%2018.png](Linux%20Installation%20Party%202020/Untitled%2018.png)

    ---

    ### Passo 7:

    O Ubuntu está a instalar! Agora é só esperar... Depois da instalação completar, reinicia o computador e segue os passos que o Ubuntu indica.

    ![Linux%20Installation%20Party%202020/Untitled%2019.png](Linux%20Installation%20Party%202020/Untitled%2019.png)

    ---

    # 💻 Seleção de Sistema Operativo

    A partir de agora, ao ligares o computador, aparecer-te-á um ecrã como este:

    ![Linux%20Installation%20Party%202020/Untitled%2020.png](Linux%20Installation%20Party%202020/Untitled%2020.png)

    Neste ecrã, podes escolher o sistema operativo que queres usar:

    1. Escolhes a primeira opção para o Ubuntu
    2. Escolhes a terceira opção para o Windows (ou a opção equivalente)

    **Ou seja, para trocares entre sistemas operativos tens sempre de desligar o computador**

    ---

    # 💿 Instalação de software importante (opcional)

    **Parabéns, já tens o Ubuntu instalado! 🎉**

    Agora, podes fazer este passo opcional para correres o nosso script, que te vai instalar programas úteis como o a plataforma de **Haskell,** o **Visual Studio Code (**um bom editor de texto), o **Git** e o **Subversion**.

    Para isso, [abre um terminal](https://linuxconfig.org/shortcuts-to-access-terminal-on-ubuntu-20-04-focal-fossa) e cola o seguinte comando:

    ```bash
    wget https://raw.githubusercontent.com/cesium/LIPscript/master/install.sh
    ```

    Pressiona **Enter** e deixa o comando correr.

    Depois, corre o seguinte comando:

    ```bash
    sh install.sh
    ```

    Pressiona **Enter** e deixa o comando correr. Durante a execução do comando, vai-te ser pedido para colocares a password; não vais conseguir ver o que estás a escrever, é normal. Às vezes, também te vai ser pedido que confirmes uma operação, escolhendo entre **[Y/n]**. Escreve **Y** e carrega no **Enter**.

    Quando o comando terminar, corre este último comando:

    ```bash
    rm install.sh
    ```

    **Tech Tip:** usa `ghci` no terminal para iniciares o interpretador de Haskell. Para saires faz `:q`🤫

    ---

    # 🏁 Chegaste ao fim do guia!

    **Bem-vindo ao mundo do Linux!**

    Há muito a descobrir, por isso solta a curiosidade e não tenhas medo de te aventurar. Porque não começas por [aprender as várias formas de instalar software no Ubuntu](https://itsfoss.com/remove-install-software-ubuntu/)? (Porque sim, mesmo que tenhas programas instalados no Windows vais ter de instalar a versão Linux deles no Ubuntu)

    ### Não te esqueças, no mundo da informática, o Google e o StackOverflow são os teus melhores amigos!

    ![Linux%20Installation%20Party%202020/Untitled%2021.png](Linux%20Installation%20Party%202020/Untitled%2021.png)
