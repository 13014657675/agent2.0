//iType=0 �� ȥ��ǰ��ո�
//iType=1 �� ȥ��ǰ�ո�
//iType=2 �� ȥ����ո�
function cTrim(sInputString,iType)
{
	var sTmpStr = ' '
	var i = -1
	if(iType == 0 || iType == 1)
	{
	while(sTmpStr == ' ')
	{
	++i
	sTmpStr = sInputString.substr(i,1)
	}
	sInputString = sInputString.substring(i)
	}
	if(iType == 0 || iType == 2)
	{
	sTmpStr = ' '
	i = sInputString.length
	while(sTmpStr == ' ')
	{
	--i
	sTmpStr = sInputString.substr(i,1)
	}
	sInputString = sInputString.substring(0,i+1)
	}
	return sInputString
}
//��֤���֤��ʽ
function reg_sfz(y_sfz)
{
	var num = cTrim(y_sfz.value,0)
    var len = num.length, re; 
    if (len == 15)
      re = new RegExp(/^(\d{6})()?(\d{2})(\d{2})(\d{2})(\d{3})$/);
    else if (len == 18)
      re = new RegExp(/^(\d{6})()?(\d{4})(\d{2})(\d{2})(\d{3})+[A-Za-z0-9]$/);
    else {alert("���֤��ʽ����ȷ"); y_sfz.value=""; return false;}
    var a = num.match(re);
    if (a != null)
    {
      if (len==15)
      {
        var D = new Date("19"+a[3]+"/"+a[4]+"/"+a[5]);
        var B = D.getYear()==a[3]&&(D.getMonth()+1)==a[4]&&D.getDate()==a[5];
      }
      else
      {
        var D = new Date(a[3]+"/"+a[4]+"/"+a[5]);
        var B = D.getFullYear()==a[3]&&(D.getMonth()+1)==a[4]&&D.getDate()==a[5];
      }
      if (!B) {alert("��������֤�ų������ڲ��ԣ�"); y_sfz.value="";  return false;}
    }
}
// ������֤
function reg_pwd(pwd)
{ 
	/*
	var msg=/^[a-zA-Z](\w){5,11}$/;
 	if(!msg.test(pwd.value))
 	{	
		alert('�����ʽ:����ĸ��������ĸ��������6~12λ');	 
		pwd.value=""; 
	}*/
	var msg=/^(?![a-zA-Z]+$)(?![0-9]+$)[a-zA-Z0-9_!.-]{6,12}$/;
 	if(!msg.test(pwd.value))
 	{	
		alert('�����ʽ:���������ĸ�����֣�������6~12λ');	 
		pwd.value=""; 
	}
	
}
//��֤���������Ƿ�һ�¸�ʽ
function reg_same(x,y)
{
	if(x.value!=y.value)
 	{	
		alert(y.getAttribute("accesskey"));
		y.value="";
	}
}
//��֤���¸�ʽ
function reg_ny(y_ny)
{	
 	var t_ny=/^[1-2]+[0-9]+[0-9]+[0-9]+[0-1]+[0-9]+$/;
 	if(!t_ny.test(y_ny.value))
 	{	
	alert(y_ny.alt);	
	y_ny.value="";
	}
} 
/*��֤������ĳ���*/
function field_length(field,length)
{
	field.value = cTrim(field.value,0) 
 	if(field.value.length<length)
 	{	
		alert(field.alt);
		field.value=''
		field.focus();
		return false;
	}	
}
//��֤�����ո�ʽ
function reg_csny(y_csny)
{
	 var t_csny=/^[1-2]+[0-9]+[0-9]+[0-9]+[0-1]+[0-9]+[0-3]+[0-9]+$/;
 	if(!t_csny.test(y_csny.value))
 	{
	alert(y_csny.alt);
	y_csny.value="";	
	}	
}
//��֤���ĺ��ָ�ʽ
function reg_zw(y_zw)
{
 var t_zw=/[\u4e00-\u9fa5]/;
 	if(!t_zw.test(y_zw.value))
 	{
	alert(y_zw.alt);
	y_zw.value="";
	}	
}
//��֤ip��ַ��ʽ
function reg_ip(y_ip)
{
 var t_ip=/^[0-2]+[0-9]*[0-9]*\.[0-2]+[0-9]*[0-9]*\.[0-2]+[0-9]*[0-9]*\.[0-2]+[0-9]*[0-9]*/	;
 	if(!t_ip.test(y_ip.value))
 	{
	alert(y_ip.alt);
	y_ip.value="";
	}	
}
//��֤email��ʽ
function reg_email(y_email)
{
 var t_email=/^\w+([-+.]\w+)*@\w+([-.]\\w+)*\.\w+([-.]\w+)*$/;
 	if(!t_email.test(y_email.value))
 	{
	alert(y_email.alt);
	y_email.value="";
	}	
}
//��֤�̶��绰��ʽ
function reg_phone(y_phone)
{
 var t_phone=/^\d{3}-\d{8}|\d{4}-\d{7}$/;
 	if(!t_phone.test(y_phone.value))
 	{
	alert(y_phone.alt);
	y_phone.value="";
	}
}
//��֤����
function reg_num(y_num)
{
	if (isNaN(y_num.value))
	 {
	 	y_num.value="0";
	 } 
}
//��֤˫���ȸ�ʽ
function reg_double(y_double)
{
	var t_double=/^-?([1-9]\d*\.\d*|0\.\d*[1-9]\d*|0?\.0+|0)$/;
 	if(!t_double.test(y_double.value))
 	{
	alert(y_double.alt);
	y_double.value="0.0";
	return false;
	}
}
//��֤��
function check_form(f)
{
	var num=0,str="";
	for(var i=0;i<f.elements.length ;i++)
	{			
		if(f[i].alt=='trim')
 		{ 			
 			f[i].value=cTrim(f[i].value,1);    //ȥ��ǰ�ո�		
 		} 			
 		if(f[i].id=='req' &&  f[i].value.length==0)
 		{
	 		num=1;str=str+f[i].title+"\n" 		
 		}	
	}
	if(num==1)
	{	
		alert(str);		
		return false;
	}
	else
	{	
		return true;
	}
}