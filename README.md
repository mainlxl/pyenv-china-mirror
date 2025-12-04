# pyenv-china-mirror

此项目是[rbenv-china-mirror](https://github.com/AndorChen/rbenv-china-mirror)的`pyenv`版本。

这是一个 [pyenv](https://github.com/pyenv/pyenv) 插件，作用是使用 [清华大学开源软件镜像站](https://mirrors.tuna.tsinghua.edu.cn/python/)安装 Python.

## 安装方法

在命令行中执行下述命令：

```sh
git clone https://github.com/mainlxl/pyenv-china-mirror.git "$(pyenv root)"/plugins/pyenv-china-mirror
```

注意，如果当前shell是fish的话，则应使用下述命令：

``` fish
git clone https://github.com/mainlxl/pyenv-china-mirror.git (pyenv root)/plugins/pyenv-china-mirror
```

## 使用方法

像往常一样安装 Python 即可，无需额外设置。

```sh
pyenv install 3.7.4
```

## 升级方法

进入 `pyenv-china-mirror` 插件所在的目录，拉取这个仓库里的最新代码：

```sh
cd ~/.pyenv/plugins/pyenv-china-mirror
git pull
```

## 卸载方法

进入 `~/.pyenv/plugins/` 目录，把 `pyenv-china-mirror` 文件夹整个删除即可。

## 工作原理

安装前，替换 Python 安装定义文件中 Python 的下载地址。安装后，再把地址改为原值。

## 作者

原作者：[Andor](http://about.ac)  
修改者：[KsRyY](https://konomo.now.sh)

## 许可证

MIT
