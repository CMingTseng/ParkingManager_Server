package com.sunset.util;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;


public class SystemUtil {
	 
		public static int  getVerifyCode() throws IOException
		{
			Random random = new Random();
			int code = Integer.MAX_VALUE - random.nextInt(Integer.MAX_VALUE);
			return code;
		}
		
		public static String encryptVerifyCode(int code )
		{
			code = 0x7fffffff-~code>>>4^0xff<<3;
			return MD5.getMD5Encoding(String.valueOf((code))).toUpperCase();
		}
		
		public static boolean isEmpty(Object obj)
		{
			if(null == obj)
				return true;
			if("".equals(obj.toString().trim()))
			{
				return true;
			}
			return false;
		}
	 
		public static String getSequenceId()
		{
			String mark = String.valueOf(System.currentTimeMillis());
			return mark;
		}
		 
		public static String getCurrentlyDateTime() {
			SimpleDateFormat dateFormat = new SimpleDateFormat(
					"yyyyMMddHHmmss");
			return dateFormat.format(new Date());
		}
		public static String getCurrentlyDate() {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
			return dateFormat.format(new Date());
		}
		public static String dateToDate(String t) {
			if(t==null)
				return null;
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
			SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String r = null;
			try {
				Date date = dateFormat.parse(t);
				r = dateFormat1.format(date);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return r;
		}
}
