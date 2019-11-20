
function MD5_TEXT(text){
	//md5加密传输
	var salt="{*nbsjt*asar#cdxd#}";
	var md5Pwd=$.md5(text+salt);
	return md5Pwd;
}