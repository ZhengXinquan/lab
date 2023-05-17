# gitea

## 相关文档

- [git](https://git-scm.com/downloads)

- [Gitea 文档](https://docs.gitea.io/zh-cn/)

- [Gitea 安装](https://www.cnblogs.com/oxspirt/p/12791510.html)

- [webhooks 自动部署](https://www.awaimai.com/2203.html)

- [Gitea 配置说明](https://docs.gitea.io/zh-cn/config-cheat-sheet/#cache---lastcommitcache-settings-cachelast_commit)

## IIS 相关

### 执行环境 与 目录权限

1. 如果进行以下配置，将直接使用管理员权限执行 —— 可以直接在 php 中执行 `shell_exec( git --version )`，无文件目录权限问题
   IIS 配置有两点要修改，找到部署服务站点的应用程序池，高级设置中有两个地方。
   1. 进程模型中的标识要修改服务器管理员账号或者有管理员权限的账户
   2. 进程模型中的加载用户配置文件设置为：True.
2. 或者使用 完整的 git 路径去执行 `C:\MyProgram\Git\cmd\git.exe --version`； 并在需要的目录设置 IUSER 用户的编辑和写入权限

```
cd C:\inetpub\wwwroot\account-book
C:\MyProgram\Git\cmd\git.exe remote set-url origin http://nanshanqiao.com:3000/gr/account-book.git
C:\MyProgram\Git\cmd\git.exe pull origin master

```

## /dev/tty: No such device or address!!!

远程链接修改为：`https://<username>:<password>@nanshanqiao.com:3000/gr/account-book.git`

## 作为 Windows 服务运行

上面的安装方式，每次 cmd 关闭都会关闭 Gitea 服务。每次都要通过 gitea-1.9.5-windows-4.0-386.exe 启动，这样很不方便。注册为 Windows 服务就方便多了 。

要注册为 Windows 服务，首先将 gitea-1.14.6-windows-4.0-amd64.exe 重命名为 gitea.exe，然后以 Administrator 身份运行 cmd，然后执行以下命令：

```
sc create gitea start= auto binPath= ""C:\gitea\gitea.exe" web --config "C:\gitea\custom\conf\app.ini""
```

注：

1. `C:\gitea\gitea.exe` 是你的 Gitea 路径。
2. 重命名后，push 可能提示 `remote: ./hooks/pre-receive.d/gitea:行2: ...` ，可以进入 gitea 的后台，管理面板中有一项: 重新同步所有仓库的 pre-receive、update 和 post-receive 钩子，点击执行即可。

之后在控制面板 —— 管理工具 —— 服务，搜索 gitea，右键选择 Run。在浏览器打开 http://localhost:3000 就可以访问了。（如果你修改了端口，请访问对应的端口，3000 是默认端口）。你也可设置为开机启动。

以 Administrator 身份运行 cmd，然后执行以下命令可以从 Windows 服务中删除 Gitea：

```
sc delete gitea
```

## 开启邮箱服务

1. 登录 163 邮箱网页版，找到 设置——更多设置——POP3/SMTP/IMAP———开启 IMAP/SMTP 服务——获取【授权码】
2. 163 邮箱端口
   ![163邮箱端口](https://nimg.ws.126.net/?url=http%3A%2F%2Fimg4.cache.netease.com%2Fhelp%2F2011%2F2%2F1%2F201102010936447869c.png&thumbnail=660x2147483647&quality=80&type=jpg)
3. 修改 gitea 的配置`custom/conf/app.ini`

```ini
[mailer]
ENABLED        = true
HOST           = smtp.163.com:465
FROM           = zheng_xin_quan@163.com
USER           = zheng_xin_quan@163.com
PASSWD         = 授权码
SKIP_VERIFY    = true
DISABLE_HELO   = true
HELO_HOSTNAME  = 163.com

```

## SSH 配置

```git bash，分别执行以下两句命令
git config --global user.name “VSNMQBQZTJCOTMFY”
git config --global user.email “邮箱”
```

1. 打开 git bash。
2. 使用 cd ~/.ssh 可以查看是否已配置 SSH。
3. 执行生成公钥和私钥的命令 ssh-keygen -t rsa 并按回车 3 下（为什么按三下，是因为有提示你是否需要设置密码，如果设置了每次使用 Git 都会用到密码，一般都是直接不写为空，直接回车就好了）。会在一个文件夹里面生成一个私钥 id_rsa 和一个公钥 id_rsa.pub。（可执行 start ~命令，生成的公私钥在 .ssh 的文件夹里面）。
4. .ssh 如果不做特殊处理的话，一般是在 C:\Users\Administrator 目录下。如果看不到.ssh 文件，可以使用 ls -ah 指令查看隐藏文件夹即可，这是存放秘钥的文件，打开这个文件会看到 id_rsa 和 id_rsa.pub。id_rsa 是私钥文件，id_rsa.pub 是公钥文件。
5. 执行查看公钥的命令 cat ~/.ssh/id_rsa.pub 。

### 测试连接 SSH

```
ssh -i ~/.ssh/id_rsa -T Administrator@nanshanqiao.com -p22
```

```
git remote add origin Administrator@nanshanqiao.com:gr/经x.git
git remote set-url origin Administrator@nanshanqiao.com:gr/account-book.git
git fetch --all
```

## password

- gitea 数据库密码 GiteaTo2641234
- git gr 123qwe 2

# gitblit

```
Dism.exe /Online /Cleanup-Image /AnalyzeComponentStore
Dism.exe /online /Cleanup-Image /StartComponentCleanup

```

[JDK 下载教程](https://jingyan.baidu.com/article/25648fc14849779191fd00fd.html)
[JDK11 下载链接](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html)
[Windows Server2012 搭建 Git 服务器](https://blog.csdn.net/u011781521/article/details/78337632)
