## 注册
/Customer/Register
```json
{
	CustomerNo:,
    CustomerPassword:,
    CustomerName:,
    CustomerSex:,
    CustomerAge:,
    CustomerID:,
    CustomerTel:,
    CustomerWorkplace:,
    CustomerAddress:,
    CustomerPost:,
    CustomerEmail:
    CustomerCreator:,
    
```
return
```json
{
	status:[success;fail]
}
```

## 管理员注册
/Stuff/Register
```json

```
## 续租
/
```
{
	orderId:,
    renewalEndDate:,
    recordCreator:,
}
```

## 取消订单
/
```
{
	orderID:,
}
```

## 出车
/
```
Form

```
## 还车
/
```
ModelAndView
```

## 退还押金


## 违章信息录入
/
```
Form
```
## 订单详情
/OrderDetail?orderID=xxx
```
ModelAndView

PostOrderInfo -ArrayList
```
## 管理员登录
/Stuff/Login
```json
{
	uername:,
    stuffPassword:,
}
{
	status:[success;fail]
}
```

## 
## index.jsp _总览_
```
## ModelAndView
{
	bookCount:,
    rentingCount:,
    backCount:,
    violateCount,
}
```
+ 预约数量
+ 出车数量
+ 已还车数量
+ 违章处理数量

# 订单管理

## booking.jsp _预约管理_
### ArrayList
```
### ModelAndView

```
+ 订单号
+ 客户姓名
+ 手机号
+ 预约时间

## renting.jsp _已出车订单_
```
### ModelAndView

```
### ArrayList
+ 订单号
+ 车牌号
+ 客户姓名
+ 出车日期
+ 租车押金

## back.jsp _已还车订单_
```
### ModelAndView

```
### ArrayList
+ 订单号
+ 车牌号
+ 客户姓名
+ 出车日期
+ 还车日期
+ 消费金额
+ 违章押金


### ArrayList
+ 订单号
+ 车牌号
+ 客户姓名
+ 出车日期
+ 还车日期
+ 违章日期
+ 消费金额
+ 违章押金
+ 违章扣款

## finish.jsp _完成订单_
```
### ModelAndView

```
### ArrayList
+ 订单号
+ 车牌号
+ 客户姓名
+ 出车日期
+ 还车日期
+ 违章日期
+ 消费金额
+ 违章押金
+ 违章扣款

# 车辆管理
## add_car.jsp _新增车辆_
```
Form
```
## ava_car.jsp _可用车辆_
```jsp
ava_car.jsp
ava_car.jsp?startDate=yyyy-mm-dd&endDate=yyyy-mm-dd&
```
```
### ModelAndView
ArrayList
{
	carNo:,
    modelType:,
    modelName:,
    modelSeatNum:,
    modelFuelTank:,
    
}
```

## car_management.jsp _所有车辆_
> todo

# 违章信息管理


## vio_reg_input.jsp _违章信息录入_

```
### ModelAndView

```

## vio-reg.jsp  _违章信息查询_
>todo

# 统计信息
## car_statistic.jsp  _车辆统计_
> todo

## finan_statistic.jsp  _财务统计_
> todo
