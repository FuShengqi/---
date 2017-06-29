<%--
  Created by IntelliJ IDEA.
  User: ogame
  Date: 17-6-29
  Time: 下午1:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>数据管理</title>


    <!-- Bootstrap Core CSS -->
    <link href="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="./vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="./dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="./vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="col-sm-10 col-md-offset-1">
    <div class="row">
        <div class="col-md-10">
            <h4 class="page-header">
                数据管理
            </h4>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <form id="customerInformaton">
                <label>
                    姓名
                </label>
                <input type="text" name="customerName" id="customerName"/>
                <label>
                    性别
                </label>
                <input type="text" name="customerSex" id="customerSex"/>
                <label>年龄</label>
                <input type="number" name="customerAge" id="customerAge"/>
                <label>
                    身份证号
                </label>
                <input type="text" name="customerID" id="customerID"/>
                <label>
                    电话
                </label>
                <input type="text" name="customerTel" id="customerTel"/>
                <label>
                    邮编
                </label>
                <input type="number" name="customerPost" id="customerPost"/>
                <label>
                    Email
                </label>
                <input type="email" name="customerEmail" id="customerEmail"/>
            </form>
        </div>

    </div>
    <div class="row">
        <div class="col-md-2" style="display: block">
            <button class="btn btn-primary" id="geneCustomerInfo">生成客户信息</button>
        </div>
        <div class="col-md-2" style="display: block">
            <button class="btn btn-primary" id="postCustomerInfo">插入客户信息</button>
        </div>
    </div>


    <hr/>
    <div class="row" style="margin-top: 30px">
        <div class="col-md-12">
            <form id="modelInformaton">
                <label>
                    车辆类型
                </label>
                <input type="text" name="modelType" id="modelType"/>
                <label>
                    车辆名称
                </label>
                <input type="text" name="modelName" id="modelName"/>
                <label>销售商</label>
                <input type="text" name="modelRetailer" id="modelRetailer"/>
                <label>
                    座位数
                </label>
                <input type="text" name="modelSeatNum" id="modelSeatNum"/>
                <label>
                    油箱容量
                </label>
                <input type="text" name="modelFuelTank" id="modelFuelTank"/>

            </form>
        </div>

    </div>
    <div class="row">
        <div class="col-md-2" style="display: block">
            <button class="btn btn-primary" id="geneModelInfo">生成车型信息</button>
        </div>
        <div class="col-md-2" style="display: block">
            <button class="btn btn-primary" id="postModelInfo">插入车型信息</button>
        </div>
    </div>

    <hr/>
    <div class="row" style="margin-top: 30px">
        <div class="col-md-12">
            <form id="carInformaton">
                <%--<label>--%>
                <%--参考ModelInfo ID--%>
                <%--</label>--%>
                <%--<select type="text" name="modelInfoId" id="modelInfoId">--%>
                <%--<option></option>--%>
                <%--</select>--%>

                <label>车辆类型</label>
                <input type="text" id="carModelType"/>
                <label>
                    车牌号
                </label>
                <input type="text" name="carNo" id="carNo"/>
                <label>
                    车辆颜色
                </label>
                <input type="text" name="carColor" id="carColor"/>
                <label>
                    购买日期
                </label>
                <input type="date" name="carBuyDate" id="purchaseD"/>
                <label>
                    发动机号
                </label>
                <input type="text" name="carEngineNo" id="carEngineN"/>
                <label>
                    车架编号
                </label>
                <input type="text" name="carFrameNo" id="carFrameN"/>
                <label>
                    燃油编号
                </label>
                <input type="text" name="carFuelN" id="carFuelN"/>
                <label>
                    所在门店
                </label>
                <input type="number" name="storeUUIDRef" value="0"/>

            </form>
        </div>

    </div>
    <div class="row">
        <div class="col-md-2" style="display: block">
            <button class="btn btn-primary" id="geneCarInfo">生成车辆信息</button>
        </div>
        <div class="col-md-2" style="display: block">
            <button class="btn btn-primary" id="postCarInfo">插入车辆信息</button>
        </div>
    </div>


    <hr/>
    <div class="row" style="margin-top: 30px">
        <div class="col-md-12">
            <form id="orderInformaton">
                <label>
                    车辆类型 参考ModelInfo ID
                </label>
                <select type="text" name="modelInfoId" id="orderModelInfoId">
                    <option></option>
                </select>

                <label>
                    当前可用车牌号
                </label>
                <input type="text" name="carID" id="orderCarNo"/>
                <label>
                    驾驶证号
                </label>
                <input type="text" name="licenseID" id="licenseID"/>
                <label>
                    客户编号
                </label>
                <input type="text" name="customerNo" id="customerNo"/>
                <label>
                    开始时间
                </label>
                <input type="date" name="orderStartDate" id="orderStartDate"/>
                <label>
                    计划还车时间
                </label>
                <input type="date" name="orderPDate" id="orderPDate"/>
            </form>
        </div>

    </div>
    <div class="row">
        <div class="col-md-2" style="display: block">
            <button class="btn btn-primary" id="geneBookInfo">生成预约信息</button>
        </div>
        <div class="col-md-2" style="display: block">
            <button class="btn btn-primary" id="postBookInfo">插入预约信息</button>
        </div>
    </div>


    <div class="row" style="display: flex;margin-top: 30px">

        <div class="col-md-2" style="display: block">
            <button class="btn btn-primary">生成车辆信息</button>
        </div>
        <div class="col-md-2">
            <button class="btn btn-primary">生成预约订单</button>
        </div>
        <div class="col-md-2">
            <button class="btn btn-primary">生成出车订单</button>
        </div>
        <div class="col-md-2">
            <button class="btn btn-primary">生成出车订单</button>
        </div>
    </div>
</div>

</body>
<script src="./vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="./vendor/bootstrap/js/bootstrap.min.js"></script>

<script>//预约信息
$('#geneBookInfo').click(function () {
    $('#orderCarNo').val('XXXX')
    var IDString = ''
    for (var i = 0; i < 18; ++i) {
        IDString += parseInt(Math.random() * 9);
    }
    $('#licenseID').val(IDString)
    var date = new Date();
    var startDate = new Date();
    startDate.setMonth(date.getMonth() - parseInt(Math.random() * 2))
    startDate.setHours(date.getHours() - parseInt(Math.random() * 24 * 9 + 24 * 5 * 2 - 3))

    var endDate = new Date();
    endDate.setMonth(startDate.getMonth());
    endDate.setHours(startDate.getHours() + 24 + Math.random() * 24 * 7);

    orderStartDate

    var day = ("0" + startDate.getDate()).slice(-2);
    var month = ("0" + (startDate.getMonth() + 1)).slice(-2);
    var today = startDate.getFullYear() + "-" + (month) + "-" + (day);
    $('#orderStartDate').val(today);
    var day = ("0" + endDate.getDate()).slice(-2);
    var month = ("0" + (endDate.getMonth() + 1)).slice(-2);
    var today = endDate.getFullYear() + "-" + (month) + "-" + (day);
    $('#orderPDate').val(today)


})
$('#postBookInfo').click(function () {
    var data = $('#orderInformaton').serializeArray();
    var jsonData = {};
    for (var i = 0; i < data.length; ++i) {
        jsonData[data[i].name] = data[i].value
    }
    $.ajax({
        type: "POST",
        url: "./Customer/Register",
        async: false,
        contentType: "application/json; charset=utf-8",
        dataType: "text",
        data: jsonDate,
        success: function (dataVal) {

        },
    })
})
</script>
<script>//车辆信息
$('#geneCarInfo').click(function () {
    var alpha = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'N'];
    var colors = ['红', '蓝', '灰', '黑', '白', '银'];
    var modelTypes = ["三厢", "两厢", "越野", "Jeep"];
    $('#carNo').val('皖'
        + alpha[parseInt(Math.random() * alpha.length)]
        + parseInt(Math.random() * 1000000)
    )
    $('#carColor').val(colors[
        parseInt(Math.random() * colors.length)
        ]);
    $('#purchaseD').val(
        parseInt(Math.random() * 8) + 2007
        + '-'
        + parseInt(Math.random() * 2 + 10)
        + '-'
        + parseInt(Math.random() * 20 + 10)
    )
    var carEngineN = ''
    for (var i = 0; i < 7; ++i) {
        carEngineN = carEngineN + parseInt(Math.random() * 9)
    }
    $('#carEngineN').val(
        alpha[parseInt(Math.random() * alpha.length)] + carEngineN
    )
    var frameN = ''
    for (var i = 0; i < 7; ++i) {
        frameN = frameN + parseInt(Math.random() * 9)
    }
    $('#carFrameN').val(
        alpha[parseInt(Math.random() * alpha.length)] + frameN
    )
    $('#carFuelN').val(
        ['96', '97', '98'][parseInt(Math.random() * 3)]
    )
    $('#carModelType').val(modelTypes[parseInt(Math.random() * modelTypes.length)])
})
$('#postCarInfo').click(function () {
    var data = $('#carInformaton').serializeArray();
    var jsonData = {};
    for (var i = 0; i < data.length; ++i) {
        jsonData[data[i].name] = data[i].value
    }
    $.ajax({
        type: "POST",
        url: "/Car/Add",
        async: false,
        contentType: "application/json; charset=utf-8",
        dataType: "text",
        data: jsonData,
        success: function (dataVal) {

        },
    })
})
</script>
<script>//车型信息
$('#geneModelInfo').click(function () {
    console.log('Genemodel info');
    var modelTypes = ["三厢", "两厢", "越野", "Jeep"];
    var modelNames = ["大众", "本田", "广汽菲克", "北京奔驰", "上汽大众", "一汽大众", "华晨宝马", "东风标致", "青年莲花", "南京依维柯"];
    var retailers = ["大众", "本田", "广汽菲克", "北京奔驰", "上汽大众", "一汽大众", "华晨宝马", "东风标致", "青年莲花", "南京依维柯"];
    $('#modelFuelTank').val(parseInt(Math.random() * 35 + 35))
    $('#modelType').val(modelTypes[parseInt(Math.random() * modelTypes.length)])
    $('#modelRetailer').val(retailers[parseInt(Math.random() * retailers.length)])

    $('#modelName').val(modelNames[parseInt(Math.random() * modelNames.length)])
    $('#modelSeatNum').val(parseInt(Math.random() * 4) + 2)

})
$('#postModelInfo').click(function () {
    var data = $('#modelInformaton').serializeArray();
    var jsonData = {}
    for (var i = 0; i < data.length; ++i) {
        jsonData[data[i].name] = data[i].value
    }
    $.ajax({
        type: "POST",
        url: "/Model/Add",
        async: false,
        contentType: "application/json; charset=utf-8",
        dataType: "text",
        data: jsonData,
        success: function (dataVal) {

        },
    })
})

</script>
<script>//生成客户信息
function getName() {
    var familyNames = new Array(
        "赵", "钱", "孙", "李", "周", "吴", "郑", "王", "冯", "陈",
        "褚", "卫", "蒋", "沈", "韩", "杨", "朱", "秦", "尤", "许",
        "何", "吕", "施", "张", "孔", "曹", "严", "华", "金", "魏",
        "陶", "姜", "戚", "谢", "邹", "喻", "柏", "水", "窦", "章",
        "云", "苏", "潘", "葛", "奚", "范", "彭", "郎", "鲁", "韦",
        "昌", "马", "苗", "凤", "花", "方", "俞", "任", "袁", "柳",
        "酆", "鲍", "史", "唐", "费", "廉", "岑", "薛", "雷", "贺",
        "倪", "汤", "滕", "殷", "罗", "毕", "郝", "邬", "安", "常",
        "乐", "于", "时", "傅", "皮", "卞", "齐", "康", "伍", "余",
        "元", "卜", "顾", "孟", "平", "黄", "和", "穆", "萧", "尹"
    );
    var givenNames = new Array(
        "子璇", "淼", "国栋", "夫子", "瑞堂", "甜", "敏", "尚", "国贤", "贺祥", "晨涛",
        "昊轩", "易轩", "益辰", "益帆", "益冉", "瑾春", "瑾昆", "春齐", "杨", "文昊",
        "东东", "雄霖", "浩晨", "熙涵", "溶溶", "冰枫", "欣欣", "宜豪", "欣慧", "建政",
        "美欣", "淑慧", "文轩", "文杰", "欣源", "忠林", "榕润", "欣汝", "慧嘉", "新建",
        "建林", "亦菲", "林", "冰洁", "佳欣", "涵涵", "禹辰", "淳美", "泽惠", "伟洋",
        "涵越", "润丽", "翔", "淑华", "晶莹", "凌晶", "苒溪", "雨涵", "嘉怡", "佳毅",
        "子辰", "佳琪", "紫轩", "瑞辰", "昕蕊", "萌", "明远", "欣宜", "泽远", "欣怡",
        "佳怡", "佳惠", "晨茜", "晨璐", "运昊", "汝鑫", "淑君", "晶滢", "润莎", "榕汕",
        "佳钰", "佳玉", "晓庆", "一鸣", "语晨", "添池", "添昊", "雨泽", "雅晗", "雅涵",
        "清妍", "诗悦", "嘉乐", "晨涵", "天赫", "玥傲", "佳昊", "天昊", "萌萌", "若萌"
    );
    var i = parseInt(Math.random() * familyNames.length);
    var familyName = familyNames[i];
    var j = parseInt(givenNames.length * Math.random());
    var givenName = givenNames[i];
    var name = familyName + givenName;
    return name
}

function getMoble() {
    var prefixArray = new Array("130", "131", "132", "133", "135", "137", "138", "170", "187", "189");
    var i = parseInt(10 * Math.random());
    var prefix = prefixArray[i];
    for (var j = 0; j < 8; j++) {
        prefix = prefix + Math.floor(Math.random() * 10);
    }
    return prefix
}

function getId_no() {
    var coefficientArray = ["7", "9", "10", "5", "8", "4", "2", "1", "6", "3", "7", "9", "10", "5", "8", "4", "2"];// 加权因子
    var lastNumberArray = ["1", "0", "X", "9", "8", "7", "6", "5", "4", "3", "2"];// 校验码
    var address = "420101"; // 住址
    var birthday = "19810101"; // 生日
    var s = Math.floor(Math.random() * 10).toString() + Math.floor(Math.random() * 10).toString() + Math.floor(Math.random() * 10).toString();
    var array = (address + birthday + s).split("");
    var total = 0;
    for (i in array) {
        total = total + parseInt(array[i]) * parseInt(coefficientArray[i]);
    }
    var lastNumber = lastNumberArray[parseInt(total % 11)];
    var id_no_String = address + birthday + s + lastNumber;
    return id_no_String;
}

$('#geneCustomerInfo').click(function () {
    $('#customerName').val(getName())
    var phone = getMoble()
    $('#customerTel').val(phone)
    $('#customerAge').val(parseInt(Math.random() * 30) + 18)
    $('#customerEmail').val(phone + '@163.com')
    $('#customerPost').val(parseInt(Math.random() * 1000000))
    $('#customerSex').val(['男', '女'][parseInt(Math.random() * 1.8)])
    $('#customerID').val(getId_no())
})


//提交用户信息
$('#postCustomerInfo').click(function () {
    var data = $('#customerInformaton').serializeArray();
    var jsonData = {}
    for (var i = 0; i < data.length; ++i) {
        jsonData[data[i].name] = data[i].value
    }
    $.ajax({
        type: "POST",
        url: "./Customer/Register",
        async: false,
        contentType: "application/json; charset=utf-8",
        dataType: "text",
        data: jsonData,
        success: function (dataVal) {

        },
    })
})
</script>
</html>
