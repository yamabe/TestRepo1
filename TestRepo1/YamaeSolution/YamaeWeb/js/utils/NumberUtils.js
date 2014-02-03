function NumberUtils() {

}





NumberUtils.Fixed = function (value, keta) {
    //最初のテキストボックスの値を数字に変換
    var num = parseFloat(value);
    var num2 = num.toFixed(keta);

    return num2;
};

NumberUtils.Floor = function(value, keta) {
    var num = parseFloat(value);

    return Math.floor(num * Math.pow(10, keta)) / Math.pow(10, keta)
};

