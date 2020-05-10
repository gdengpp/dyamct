package com.amct.util;


import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.util.Random;

public class ImageUtil {
	

	 public static BufferedImage createImage(String securityCode){
	        int codeLength = securityCode.length();//验证码长度
	        int fontSize = 20;//字体大小
	        int fontWidth = fontSize+1;
	        //图片宽高
	        int width = codeLength*fontWidth;
	        int height = fontSize*2;
	        //图片
	        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
	        Graphics2D g = image.createGraphics();
	        g.setColor(Color.WHITE);//设置背景色
	        g.fillRect(0, 0, width, height);//填充背景
	        g.setColor(Color.LIGHT_GRAY);//设置边框颜色
	        g.setFont(new Font("Courier New", Font.BOLD, height-2));//边框字体样式
	        g.drawRect(0, 0,0, 0);//绘制边框
	        //绘制噪点
	        Random rand = new Random();
	        g.setColor(Color.LIGHT_GRAY);
	        for (int i = 0; i < codeLength*6; i++) {
	            int x = rand.nextInt(width);
	            int y = rand.nextInt(height);
	            g.drawRect(x, y, 1, 1);//绘制1*1大小的矩形
	        }

	        //绘制验证码
	        int codeY = height-10;
	        g.setColor(new Color(19,148,246));
	        g.setFont(new Font("Georgia", Font.BOLD, fontSize));
	        for(int i=0;i<codeLength;i++){
	        	double deg=new Random().nextDouble()*20;
	        	g.rotate(Math.toRadians(deg), i*16+13,codeY-7.5);
	           g.drawString(String.valueOf(securityCode.charAt(i)), i*16+5, codeY);
	        	g.rotate(Math.toRadians(-deg), i*16+13,codeY-7.5);
	        }
	        g.dispose();//关闭资源
	        return image;
	    }
	 /**
	  *
	  * @param len  :获得随机数的长度
	  * @return
	  * @time ：下午4:50:50
	  * @功能描述： 获得随机数
	  */
	 public static String getCode(int len){
		 String str ="abcdefgkijklmnopqrstuvwxyzABCDEFJKIGKLMNOPQRSTUVWXYZ0123456789";
		 int leng = str.length();
		 Random r = new Random();
		 String code="";
		 for(int i=0;i<len;i++){
			 char cc = str.charAt(r.nextInt(leng));//r.nextInt(100);
			 code = code+cc;
		 }
		 return code;
	 }
	
}
