package com.amct.net;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;

public class testMsg {

	public static void main(String[] args) throws IOException {
		DatagramSocket ds = null;

		byte[] buf = new byte[1024];

		DatagramPacket dp = null;

		ds = new DatagramSocket(9000);

		dp = new DatagramPacket(buf, 1024);

		System.out.println("等待接收消息：");

		ds.receive(dp);

		String str = new String(dp.getData(), 0, dp.getLength());

		System.out.println(str);

		ds.close();

	}
}
