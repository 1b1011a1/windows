# *白嫖云电脑*
**重要说明：** 时长为无限的，但一次只可以用5小时
## 说明
本仓库是利用github的Action,它可以在公开仓库中免费无限使用   
**仓库状态和Action的免费使用时长关系：**
> | 仓库状态 | 免费时长/每月 |
> | -------  | ------------- |
> | 私人仓库  |    2000 分钟  |
> | 组织仓库  |   3000 分钟   |
> | 公开仓库  |    无限时长   |  

这本来是我的私人仓库  
但是个人免费时长被我花3天霍霍完了  
想着让其他人也可以**白嫖**（主要是我把个人免费时长霍霍光了，没得玩了）  
系统为最新windows系统,目前为 **Windows Server 2022 Datacenter** 系统默认语言为英文，可以自己去设置改
## 使用方法
1. 滚去[cpolar](https://dashboard.cpolar.com/)注册账号(不用实名,选免费套餐即可).
2. 再滚去[github](https://github.com/)注册或登录账号.
3. 先下载这个仓库,然后提交到你自己的github账号下(建议设为公开,原因去看上文的 ***说明*** .
4. 复制[cpolar](https://dashboard.cpolar.com/get-started)下的 **设置与安装** 下的 **连接您的帐户** 下的类似``` $ ./cpolar authtoken ```的内容后的字符串
5. 把刚刚复制的字符串设置为"**secret**"(在仓库 -> ***Setting*** -> ***Secret and variables*** -> ***Actions*** -> ***New repository secret***)
6. **Name* 填 **CPLAR_TOKEN** ， **Secret** 填把刚刚复制的字符串，然后保存.
7. 清空README.md文件并提交.


## 系统截图

![效果图1](/images/1.jpg)
![效果图2](/images/2.png)
