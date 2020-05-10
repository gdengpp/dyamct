package com.amct.net;

import java.io.IOException;
import java.io.InputStream;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.URL;
import java.util.Scanner;

import org.junit.Test;

public class testNet {

	@Test
	public void testSend() throws IOException {
		DatagramSocket ds = null;

		DatagramPacket dp = null;

		ds = new DatagramSocket(3000);

		String str = "123153";
		dp = new DatagramPacket(str.getBytes(), str.length(),
				InetAddress.getByName("localhost"), 9000);
		System.out.println("发送消息");
		ds.send(dp);
		ds.close();

	}

	@Test
	public void testURL() throws Exception {

		URL url = new URL("http", "127.0.0.1", 8080, "/amct/login.jsp");

		InputStream input = url.openStream();

		Scanner scan = new Scanner(input);

		scan.useDelimiter("\n");
		while (scan.hasNext()) {
			System.out.println(scan.next());
		}
	}

	public static void main(String[] args) throws Exception {
		Inet4Address loca4lAdd = null;

		Inet4Address rem4Add = null;

		InetAddress localAdd = null;

		InetAddress remAdd = null;

		loca4lAdd = (Inet4Address) InetAddress.getLocalHost();

		rem4Add = (Inet4Address) InetAddress.getByName("www.baidu.com");

		localAdd = InetAddress.getLocalHost();

		remAdd = InetAddress.getByName("www.baidu.com");

		System.out.println(loca4lAdd.getCanonicalHostName());
		System.out.println(loca4lAdd.isReachable(5000));
		System.out.println("==============");
		System.out.println(rem4Add);
		System.out.println(rem4Add.isReachable(5000));
		System.out.println("==============");
		System.out.println(localAdd);
		System.out.println(localAdd.isReachable(5000));
		System.out.println("==============");
		System.out.println(remAdd);
		System.out.println(remAdd.isReachable(5000));

	}
}
