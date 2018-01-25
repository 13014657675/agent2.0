<%@ page autoFlush="false" contentType="image/jpeg" pageEncoding="gbk"   import="java.awt.*,java.awt.image.*,com.sun.image.codec.jpeg.*,java.util.*" %><%

//	验证码页面 ：	20081222 修改 翟


String chose="0123456789";
char display[]={'0',' ','0',' ','0',' ','0'},ran[]={'0','0','0','0'},temp;
Random rand=new Random();
for(int i=0;i<4;i++)
{
 temp=chose.charAt(rand.nextInt(chose.length()));
 display[i*2]=temp;
 ran[i]=temp;
 }
 
String random=String.valueOf(display);
session.setAttribute("c_random",String.valueOf(ran));

 try{
	    out.clear();       
        response.setContentType("image/jpeg");
        response.addHeader("pragma","NO-cache");
        response.addHeader("Cache-Control","no-cache");
        response.addDateHeader("Expries",0);
        int width=70, height=23;
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics g = image.getGraphics();
    
        g.setColor(Color.white);
        g.fillRect(0, 0, width, height);
        g.setColor(Color.RED);
        Font font=new Font("Arial",Font.PLAIN,19);
        g.setFont(font);
      
        g.drawString(random,5,20);
        g.dispose();
 
        ServletOutputStream outStream = response.getOutputStream();
       
        JPEGImageEncoder encoder =JPEGCodec.createJPEGEncoder(outStream);
       
        encoder.encode(image);
   
        outStream.close();
         }catch(Exception e)
         {
         
         }
          
   %>