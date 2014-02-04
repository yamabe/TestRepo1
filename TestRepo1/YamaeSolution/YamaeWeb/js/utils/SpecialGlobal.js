

function V(ele) {
    var val = ele.val();
    val = StringUtils.replaceAll(val, '¥', "");
    return eval(val);
}


function Fixed(value, keta) {
    return NumberUtils.Fixed(value, keta);
}



function Floor(value, keta) {
    return NumberUtils.Floor(value, keta);
}


function BindEvent(ele, func) {
    return JQueryUtils.bindEvent(ele, func);
}
