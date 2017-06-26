1. ** 功能要求 **
    1. 客户：

        + 注册/登录租车系统
        + 基本信息更新
        + 车辆信息浏览
        + 车辆预订
        + 预订订单信息更新(查看、增加、修改、删除)

    2. 工作人员：
        + 注册/登录租车系统
        + 客户基本信息更新
        + 车辆信息更新(查看、增加、修改、删除)
        + 订单信息更新(查看、增加、修改、删除)
        + 门店信息更新(查看、增加、修改、删除)
        + 续租信息更新(查看、增加、修改、删除)
        + 违章事务处理
        + 费用计算

    3. 信息统计功能：

        + 财务信息统计功能
        + 里程信息统计功能
        + 客户使用信息统计
        + 阶段租车使用统计
2. ** 信息要求 **   
    客户可以查看车辆基本信息、生成订单、查看订单、修改订单、删除订单、修改个人资料等。

    工作人员可以查询所有车辆基本信息以及所有客户基本信息、查询订单情况、删除订单、生成订单、记录订单信息、记录租车人的违约信息、车辆事故信息。

3. ** 处理要求**

    当有订单生成或者删除的时候，系统需要及时更新系统中的车辆信息和订单信息，维护系统的信息的统一性。

4. ** 安全性与完整性要求**

    系统应设置访问用户的标识以鉴别是否是合法用户，并要求合法用户设置其密码，保证用户身份不被盗用。

5. ** 总结**

    从上述的功能分析可以得出，租车系统中需要有工作人员和客户两种模式，需要满足工作人员和客户的功能需求；工作人员功能有：注册/登录、信心更新、续租处理、违章处理等功能，其中信息更新包括对车辆基本信息进行更新、客户基本信息更新和订单信息更新等；用户功能需求有注册/登录、租车、还车和信息更新，其中信息更新包括对用户基本信息的更新和订单信息的更新。

** 租车系统中的车辆租赁的基本规则如下：**

1. 客户可以通过网上预订、电话预订、门店预订的方式预订租车服务；
2. 网上预订租车服务时，系统需要检查用户的信息是否合法对租车的权限进行限制；
3. 每位客户每次限租1辆，即在所租车辆未归还前，不能租用其他车辆；
4. 每辆车在同一时间端内只允许被一个用户租赁；
5. 每位客户在租赁时需要向租车公司缴一定的租车押金；
6. 客户在还车时，工作人员需要对车辆进行检查，若在租车期间车辆发生一定的损坏需要交付一定赔偿金，同时返回租车押金；
7. 客户在还车过程中，还需要缴一定的违章押金，如果在一个月之内发生违章，则需要根据交警违章处理结果进行一定的押金抵扣和其他形式赔偿，若一个月之内，没有查询到交警的违章处理，则返还违章押金。
8. 租车费用根据租车时间和租赁价格进行计算，可能包含超时费用、超公里费用，及优惠金额，其中费用可能包含发生的违章保证金及其他未结清的费用押金。



6 . ** 数据库表设计 **

1 . 车型基本信息（ModelInfo）

| **字段** | **类型** | **空** | **约束** | **注释** |
| --- | --- | --- | --- | --- |
| ID | Char(32) | Not Null | Primary Key | ID |
| Model\_type | Char(10) | Not Null |   | 车辆类型 |
| Model\_name | Char(10) |   |   | 车辆名称 |
| Model\_retailer | Char(8) |   |   | 销售商 |
| Model\_seat\_num | smallInt | NotNull |   | 座位数 |
| Model\_fuel\_tank | smallInt | NotNull |   | 油箱容量 |
| Model\_\_status | Boolean |   |   | 车型状态 |
| record\_creator | Char(32) | NotNull | ForeignKey | 记录创建人 |
| record\_create\_time |  Date | NotNull |   | 记录创建时间 |

2 . 车辆基本信息（CarInfo）

| **字段** | **类型** | **空** | **约束** | **注释** |
| --- | --- | --- | --- | --- |
| ID | Char(32) | NotNull | PrimaryKey | ID |
| ModelInfoID | Char(32) | NotNull | ForeignKey | 参考ModelInfo的ID |
| Car\_no | Char(8) | Not Null | Unique | 车牌号 |
| Car\_color | Char(4) | Not Null |   | 车辆颜色 |
| Car\_purchaseD | Date |   |   | 购买日期 |
| Car\_engineN | Char(8) | Not Null |   | 发动机号 |
| Car\_frameN | Char(8) | Not Null |   | 车架编号 |
| Car\_fuelN | Char(8) | Not Null |   | 燃油编号 |
| Car\_status | Boolean |   |   | 车辆状态 |
| Store\_UUID\_Ref | Char(32) | NotNull | ForeignKey | 车辆所在门店 |
| Car\_creator | Char(10) | NotNull | ForeignKey | 记录创建人 |
| Car\_createtime | Date | NotNull |   | 记录创建时间 |

3 . 租赁价格信息（RentpriceInfo）

| **字段** | **类型** | **空** | **约束** | **注释** |
| --- | --- | --- | --- | --- |
| ID | Char(32) | NotNull | PrimaryKey | ID |
| ModeInfoID | Char(32) | NotNull | ForeignKey | 参考ModelInfo的ID |
| Ullage\_deposit | Float | Not Null |   | 车损押金 |
| Price\_dailyM | Float | Not Null |   | 日租金 |
| Price\_daily | Float |   |   | 日公里限制 |
| Price\_overtime | Float |   | 15元/小时 | 超时费用 |
| Price\_overkm | Float |   | 5元/千米 | 超公里费用 |
| Price\_status | Boolean |   |   | 租赁状态 |
| Price\_creator | Char(10) | NotNull | ForeignKey | 记录创建人 |
| Price\_createtime | Date | NotNull |   | 记录创建时间 |

4 .门店信息（StoreInfo）

| **字段** | **类型** | **空** | **约束** | **注释** |
| --- | --- | --- | --- | --- |
| ID | Char(32) | NotNull | PrimaryKey | ID |
| Store\_no | Char(10) | Not Null | Unique | 门店编号 |
| Store\_address | Char(20) | Not Null |   | 门店地址 |
| Store\_Tel | Char(20) | Not Null |   | 门店联系方式 |
| Store\_Openhours | Char(10) | Not Null |   | 门店营业时间 |
| Store\_status | Boolean |   |   | 门店状态 |
| Store\_creator | Char(10) | NotNull | ForeignKey | 记录创建人 |
| Store\_createtime | Date | NotNull |   | 记录创建时间 |

5 .基本信息（CustomerInfo）

| **字段** | **类型** | **空** | **约束** | **注释** |
| --- | --- | --- | --- | --- |
| ID | Char(32) | NotNull | PrimaryKey | 全局统一标识符 |
| Customer\_no | Char(6) |   | Unique | 用户编号 |
| Customer\_password | Char(10) |   |   | 密码 |
| Customer\_name | Char(10) |   |   | 姓名 |
| Customer\_sex | Char(2) |   |   | 性别 |
| Customer\_age |  smallint |   |   | 年龄 |
| Customer\_ID | Char(18) | Not Null |   | 身份证号 |
| Customer\_Tel | Char(15) |   |   | 电话 |
| Customer\_workplace | Char(15) |   |   | 工作单位 |
| Customer\_address | Char(20) |   |   | 地址 |
| Customer\_post | Char(6) |   |   | 邮编 |
| Customer\_eMail | Char(15) | Not Null |   | eMail |
| Customer\_status | boolean |   |   | 客户状态 |
| record\_creator | Char(32) | NotNull | ForeignKey | 记录创建人 |
|  record\_creator\_time | Date | NotNull |   | 记录创建时间 |

6 .驾驶证信息（LicenceInfo）

| **字段** | **类型** | **空** | **约束** | **注释** |
| --- | --- | --- | --- | --- |
| ID | Char(32) | NotNull | PrimaryKey | ID |
| License\_no | Char(12) | Not Null | Unique | 驾驶证号 |
| License\_type | Char(10) | Not Null |   | 驾照类型 |
| License\_ages | smallint | Not Null |   | 驾龄 |
| License\_start\_date | Date | Not Null |   | 发证日期 |
| License\_invalid\_date | Date | Not Null |   | 失效日期 |
| License\_status | Boolean |   |   | 状态 |
| record\_creator | Char(32) | NotNull | ForeignKey | 记录创建人 |
| record\_creator\_time | Date | NotNull |   | 记录创建时间 |



7 .订单信息（OrderInfo）

| **字段** | **类型** | **空** | **约束** | **注释** |
| --- | --- | --- | --- | --- |
| ID | Char(32) | NotNull | PrimaryKey | ID |
| Order\_no | Char(16) | Not Null | Unique | 订单号 |
| car\_id | Char(32) | Not Null |   | 车牌号 |
| License\_id | Char(12) | Not Null |   | 车辆类型 |
| Customer\_id | Char(6) | Not Null |   | 驾驶证号 |
| Customer\_no | Char(10) | Not Null |   | 客户编号 |
| Order\_startD | Date |   |   | 开始时间 |
| Order\_P\_endID | Date |   |   | 计划还车时间 |
| Order\_A\_endD | Date |   |   | 实际还车时间 |
| Order\_startM | Float |   |   | 开始里程 |
| Order\_endM | Float |   |   | 结束里程 |
| Order\_useM | Float |   |   | 使用里程 |
| Order\_basicF | Float |   |   | 基本消费 |
| Order\_timeoutF | Float |   |   | 超时金额 |
| Order\_mileoutF | Float |   |   | 超里程金额 |
| Order\_discountF | Float |   |   | 优惠金额 |
| Order\_deposit | Float |   |   | 租车押金 |
| Violate\_deposit | Float |   |   | 违章押金 |
| Ullage\_deposit | Float |   |   | 车损押金 |
| Order\_violateF | Float |   |   | 违章罚款 |
| Order\_ullageF | Float |   |   | 车损扣款 |
| Order\_sumF | Float |   |   | 消费金额 |
| Order\_status | Char(8) |   |   | 订单状态 |
| Order \_creator | Char(10) | NotNull | ForeignKey | 记录创建人 |
| Order \_createtime | Date | NotNull |   | 记录创建时间 |

8 . 续租订单信息（PostOrderInfo）

| **字段** | **类型** | **空** | **约束** | **注释** |
| --- | --- | --- | --- | --- |
| ID | Char(32) | NotNull | PrimaryKey | ID |
| order\_id | Char(16) | NotNull | ForeignKey | 续租的主订单号 |
| renewal\_start\_date | Date | Not Null | Unique | 续租订单号 |
| renewal\_end\_date | Date |   |   | 开始时间 |
| renewal\_deposit | Float |   |   | 结束时间 |
| renewal\_status | Boolean |   |   | 租车押金 |
| record\_creator | Char(32) |   |   | 续租状态 |
| record\_creator\_time | Date | NotNull | ForeignKey | 记录创建人 |
| ID | Char(32) | NotNull |   | 记录创建时间 |

9 .违章信息（ViolateInfo）

| **字段** | **类型** | **空** | **约束** | **注释** |
| --- | --- | --- | --- | --- |
| ID | Char(32) | NotNull | PrimaryKey | ID |
| CarInfoID | Char(32) | NotNull | ForeignKey | 违章车辆标志号 |
| Violate\_date | Date | Not Null |   | 违章时间 |
| Violate\_event | Char(8) |   |   | 违章事件 |
| Violate\_ marks | Float |   |   | 扣分 |
| Violate\_fee | Float |   |   | 违章罚款 |
| Violate\_status | Boolean |   |   | 状态 |
| Violate \_creator | Char(10) | NotNull | ForeignKey | 记录创建人 |
| Violate \_createtime | Date | NotNull |   | 记录创建时间 |

【开发工具】

开发方式：采用B-S模式，MySQL数据库，运行在Linux服务器上，后台程序运用JAVA语言，采用springMVC+spring+mybatis框架开发。前台采用bootstrap搭建网站。
