package com.amct.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.amct.util.ImageUtil;

@Controller
@RequestMapping("/captcha")
@Scope("prototype")
public class captchaController {

	// 验证码
	@RequestMapping("getCode")
	public ModelAndView getCode(HttpSession session,
			HttpServletResponse response) throws IOException {
		// 通过工具类获得随机数
		String code = ImageUtil.getCode(4);
		System.out.println(code);
		// 把生成的验证码随机数保存在session中
		session.setAttribute("code", code);
		// 通过工具类画验证码图片+随机数
		BufferedImage img = ImageUtil.createImage(code);
		// 把验证码图片写到页面中
		ImageIO.write(img, "png", response.getOutputStream());
		return null;// 只做验证码的显示，不跳转
	}
}