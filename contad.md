
### 定时任务

#### 每日封顶刷新（凌晨0点0分执行）

0 0 * * *  /usr/local/php/bin/php /home/wwwroot/rcrc/think everyDay >> /root/1.log

#### 矿机收益 （凌晨0点1分执行）

1 0 * * * /usr/local/php/bin/php /home/wwwroot/rcrc/think product-income >> /root/2.log

#### 矿机分红收益 （凌晨2点执行）

0 2 * * * /usr/local/php/bin/php /home/wwwroot/rcrc/think reward >> /root/3.log

#### 全球分红收益 （凌晨3点执行）

0 3 * * * /usr/local/php/bin/php /home/wwwroot/rcrc/think share >> /root/4.log