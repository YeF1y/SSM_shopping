package com.controller;

import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.entity.Admins;
import com.entity.Goods;
import com.entity.Tops;
import com.entity.Types;
import com.entity.Users;
import com.service.AdminService;
import com.service.GoodService;
import com.service.OrderService;
import com.service.TopService;
import com.service.TypeService;
import com.service.UserService;
import com.util.PageUtil;
import com.util.UploadUtil;

/**
 * 后台相关接口 
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

	private static final int rows = 6;

	@Autowired
	private AdminService adminService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private UserService userService;
	@Autowired
	private GoodService goodService;
	@Autowired
	private TopService topService;
	@Autowired
	private TypeService typeService;


	/**
	 * 管理员登录
	 * @return
	 */
	@RequestMapping("/login")
	public String login(Admins admin, HttpServletRequest request, HttpSession session) {//后台登录
		System.out.println("SSSSSS");
		System.out.println(admin.toString());
		if (adminService.checkUser(admin.getUsername(), admin.getPassword())) {
			Admins byAdmins = adminService.getByUsername(admin.getUsername());
			session.setAttribute("username", admin.getUsername());
			session.setAttribute("adminId", byAdmins.getId());
			session.setAttribute("type", byAdmins.getType());
			session.setAttribute("admin", byAdmins);
			return "redirect:/admin/orderList";
		}
		request.setAttribute("msg", "用户名或密码错误!");
		return "/admin/login.jsp";
	}
	
	/**
	 * 商家注册
	 * @return
	 */
	@RequestMapping("/registerSJ")
	public String register(Admins admin, HttpServletRequest request, HttpSession session) {
		System.out.println(111);
		System.out.println(admin.toString());
		if (adminService.isExist(admin.getUsername())) {
			request.setAttribute("msg", "该账号已存在!");
		}else {
			adminService.add(admin);
			request.setAttribute("msg", "添加成功!");
			
		}
		return "/admin/register.jsp";
	}

	/**
	 * 退出
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("admin");
		session.removeAttribute("username");
		session.removeAttribute("admin");
		return "/admin/login.jsp";
	}

	/**
	 * 注销
	 * @return
	 */
	@RequestMapping("/logout2")
	public String logout2(HttpSession session) {
		Admins admin = (Admins) session.getAttribute("admin");
		adminService.delete(admin);
		session.removeAttribute("admin");
		session.removeAttribute("username");
		session.removeAttribute("admin");
		return "/admin/login.jsp";
	}

	/**
	 * 后台首页
	 * @return
	 */
	@RequestMapping("/index")
	public String index(HttpServletRequest request) {
		request.setAttribute("msg", "恭喜你! 登录成功了");
		return "/admin/index.jsp";
	}

	/**
	 * 订单列表
	 * 
	 * @return
	 */
	@RequestMapping("/orderList")
	public String orderList(@RequestParam(required=false, defaultValue="0")byte status, HttpServletRequest request, HttpSession session,
			@RequestParam(required=false, defaultValue="1") int page) {
		request.setAttribute("flag", 1);
		request.setAttribute("status", status);
		Admins admin = (Admins)session.getAttribute("admin");
		if(admin.getType().equals("管理员")) {
			request.setAttribute("orderList", orderService.getList(status, page, rows));
			if(status==0){
				request.setAttribute("pageTool", 
				PageUtil.getPageTool(request, orderService.getTotal1(), page, rows));
			}else{
				request.setAttribute("pageTool", 
				PageUtil.getPageTool(request, orderService.getTotal(status), page, rows));
			}
		}else {
			request.setAttribute("orderList", orderService.getListByUserId(admin.getId(), status, page, rows));
			if(status==0){
				request.setAttribute("pageTool", 
				PageUtil.getPageTool(request, orderService.getTotal1ByUserId(admin.getId()), page, rows));
			}else{
				request.setAttribute("pageTool", 
				PageUtil.getPageTool(request, orderService.getTotalByUserId(admin.getId(), status), page, rows));
			}
		}
		
		request.setAttribute("pa","order1" );
		return "/admin/index.jsp";
		
	}
	
	/**
	 * 订单列表
	 * 
	 * @return
	 */
	@RequestMapping("/orderSearch")
	public String orderSearch(@RequestParam(required=false, defaultValue="0")int id, HttpServletRequest request) {
		if(id > 0) {
			request.setAttribute("flag", 1);
			request.setAttribute("orderList", orderService.getListById(id));
			request.setAttribute("pa","order1" );
			return "/admin/index.jsp";
		}else {
			request.setAttribute("pa","order1" );
			return "redirect:/admin/orderList";
		}
	}

	/**
	 * 订单发货
	 * 
	 * @return
	 */
	@RequestMapping("/orderDispose")
	public String orderDispose(int id, byte status,
			@RequestParam(required=false, defaultValue="1") int page) {
		orderService.dispose(id);
		return "redirect:orderList?flag=1&status="+status+"&page="+page;
	}
	
	/**
	 * 订单完成
	 * 
	 * @return
	 */
	@RequestMapping("/orderFinish")
	public String orderFinish(int id, byte status,
			@RequestParam(required=false, defaultValue="1") int page) {
		orderService.finish(id);
		return "redirect:orderList?flag=1&status="+status+"&page="+page;
	}

	/**
	 * 订单删除
	 * 
	 * @return
	 */
	@RequestMapping("/orderDelete")
	public String orderDelete(int id, byte status,
			@RequestParam(required=false, defaultValue="1") int page) {
		orderService.delete(id);
		return "redirect:orderList?flag=1&status="+status+"&page="+page;
	}

	/**
	 * 顾客管理
	 * 
	 * @return
	 */
	@RequestMapping("/userList")
	public String userList(HttpServletRequest request,
			@RequestParam(required=false, defaultValue="1") int page) {
		request.setAttribute("flag", 2);
		request.setAttribute("userList", userService.getList(page, rows));
		request.setAttribute("pageTool", PageUtil.getPageTool(request, userService.getTotal(), page, rows));
		request.setAttribute("pa", "user_list");
		return "/admin/index.jsp";
	}
	
	/**
	 * 通过名称搜索列表
	 * 
	 * @return
	 */
	@RequestMapping("/userSearch")
	public String userSearch(String name, HttpServletRequest request) {
		request.setAttribute("flag", 2);
		request.setAttribute("userList", userService.getListByName(name));
		request.setAttribute("pa", "user_list");
		return "/admin/index.jsp";
	}

	/**
	 * 用户添加
	 * 
	 * @return
	 */
	@RequestMapping("/userAdd")
	public String userAdd(HttpServletRequest request) {
		request.setAttribute("flag", 2);
		request.setAttribute("pa", "user_list_add");
		return "/admin/index.jsp";
	}

	/**
	 * 用户添加
	 * 
	 * @return
	 */
	@RequestMapping("/userSave")
	public String userSave(Users user, HttpServletRequest request, 
			@RequestParam(required=false, defaultValue="1") int page) {
		if (userService.isExist(user.getUsername())) {
			request.setAttribute("msg", "用户名已存在!");
			return "/admin/user_add.jsp";
		}
		userService.add(user);
		return "redirect:userList?flag=2&page="+page;
	}

	/**
	 * 用户密码重置页面
	 * 
	 * @return
	 */
	@RequestMapping("/userRe")
	public String userRe(int id, HttpServletRequest request) {
		request.setAttribute("flag", 2);
		request.setAttribute("user", userService.get(id));
		request.setAttribute("pa", "user_reset");
		return "/admin/index.jsp";
	}

	/**
	 * 用户密码重置
	 * 
	 * @return
	 */
	@RequestMapping("/userReset")
	public String userReset(Users user, 
			@RequestParam(required=false, defaultValue="1") int page) {
		String password = user.getPassword();
		user = userService.get(user.getId());
		user.setPassword(password);
		userService.update(user);
		return "redirect:userList?flag=2&page="+page;
	}

	/**
	 * 用户更新
	 * 
	 * @return
	 */
	@RequestMapping("/userEdit")
	public String userEdit(int id, HttpServletRequest request) {
		request.setAttribute("flag", 2);
		request.setAttribute("pa", "user_edit");
		request.setAttribute("user", userService.get(id));
		return "/admin/index.jsp";
	}

	/**
	 * 用户更新
	 * 
	 * @return
	 */
	@RequestMapping("/userUpdate")
	public String userUpdate(Users user, 
			@RequestParam(required=false, defaultValue="1") int page) {
		userService.update(user);
		return "redirect:userList?flag=2&page="+page;
	}

	/**
	 * 用户删除
	 * 
	 * @return
	 */
	@RequestMapping("/userDelete")
	public String userDelete(Users user, 
			@RequestParam(required=false, defaultValue="1") int page) {
		userService.delete(user);
		return "redirect:userList?flag=2&page="+page;
	}

	/**
	 * 产品列表
	 * 
	 * @return
	 */
	@RequestMapping("/goodList")
	public String goodList(@RequestParam(required=false, defaultValue="0")byte status, HttpServletRequest request, HttpSession session,
			@RequestParam(required=false, defaultValue="1") int page) {
		request.setAttribute("flag", 3);
		request.setAttribute("page", page);
		request.setAttribute("status", status);
		
		Admins admin = (Admins)session.getAttribute("admin");
		if(admin.getType().equals("管理员")) {
			request.setAttribute("goodList", goodService.getList(status, page, rows));
			request.setAttribute("pageTool", PageUtil.getPageTool(request, goodService.getTotal(status), page, rows));
		}else {
			request.setAttribute("goodList", goodService.getListByUserId(admin.getId(), status, page, rows));
			request.setAttribute("pageTool", PageUtil.getPageTool(request, goodService.getTotalByUserId(admin.getId(), status), page, rows));
		}
		
		request.setAttribute("pa", "good_list");
		
		return "/admin/index.jsp";
	}
	
	/**
	 * 通过名称获取列表
	 * 
	 * @return
	 */
	@RequestMapping("/goodSearch")
	public String goodSearch(String name, HttpServletRequest request, 
			@RequestParam(required=false, defaultValue="1") int page) {
		request.setAttribute("flag", 3);
		request.setAttribute("goodList", goodService.getListByName(name, page, rows));
		request.setAttribute("pageTool", PageUtil.getPageTool(request, goodService.getTotalByName(name), page, rows));
		request.setAttribute("pa", "good_list");
		return "/admin/index.jsp";
	}

	/**
	 * 产品添加
	 * 
	 * @return
	 */
	@RequestMapping("/goodAdd")
	public String goodAdd(HttpServletRequest request) {
		request.setAttribute("flag", 3);
		request.setAttribute("pa", "good_add");
		request.setAttribute("typeList", typeService.getList());
		return "/admin/index.jsp";
	}

	/**
	 * 产品添加
	 * 
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/goodSave")
	public String goodSave(int adminId, String name, int price, String intro, int stock, int typeId, 
			MultipartFile cover, MultipartFile image1, MultipartFile image2, 
			@RequestParam(required=false, defaultValue="1") int page) throws Exception {
		Goods good = new Goods();
		good.setAdminId(adminId);
		good.setName(name);
		good.setPrice(price);
		good.setIntro(intro);
		good.setStock(stock);
		good.setTypeId(typeId);
		good.setCover(UploadUtil.fileUpload(cover));
		good.setImage1(UploadUtil.fileUpload(image1));
		good.setImage2(UploadUtil.fileUpload(image2));
		goodService.add(good);
		return "redirect:goodList?flag=3&page="+page;
	}

	/**
	 * 产品更新
	 * 
	 * @return
	 */
	@RequestMapping("/goodEdit")
	public String goodEdit(int id, HttpServletRequest request) {
		request.setAttribute("flag", 3);
		request.setAttribute("typeList", typeService.getList());
		request.setAttribute("good", goodService.get(id));
		request.setAttribute("pa", "good_edit");
		return "/admin/index.jsp";
	}

	/**
	 * 产品更新
	 * 
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/goodUpdate")
	public String goodUpdate(int id, int adminId, String name, int price, String intro, int stock, int typeId,  
			MultipartFile cover, MultipartFile image1, MultipartFile image2,
			@RequestParam(required=false, defaultValue="1") int page) throws Exception {
		Goods good = goodService.get(id);
		good.setAdminId(adminId);
		good.setName(name);
		good.setPrice(price);
		good.setIntro(intro);
		good.setStock(stock);
		good.setTypeId(typeId);
		if (Objects.nonNull(cover) && !cover.isEmpty()) {
			good.setCover(UploadUtil.fileUpload(cover));
		}
		if (Objects.nonNull(image1) && !image1.isEmpty()) {
			good.setImage1(UploadUtil.fileUpload(image1));
		}
		if (Objects.nonNull(image2) && !image2.isEmpty()) {
			good.setImage2(UploadUtil.fileUpload(image2));
		}
		goodService.update(good);
		return "redirect:goodList?flag=3&page="+page;
	}

	/**
	 * 产品删除
	 * 
	 * @return
	 */
	@RequestMapping("/goodDelete")
	public String goodDelete(int id, 
			@RequestParam(required=false, defaultValue="1") int page) {
		goodService.delete(id);
		return "redirect:goodList?flag=3&page="+page;
	}
	
	/**
	 * 添加推荐
	 * @return
	 */
	@RequestMapping("/topSave")
	public @ResponseBody String topSave(Tops tops, 
			@RequestParam(required=false, defaultValue="0")byte status,
			@RequestParam(required=false, defaultValue="1") int page) {
		int id = topService.add(tops);
		return id > 0 ? "ok" : null;
	}
	
	/**
	 * 删除推荐
	 * @return
	 */
	@RequestMapping("/topDelete")
	public @ResponseBody String topDelete(Tops tops, 
			@RequestParam(required=false, defaultValue="0")byte status,
			@RequestParam(required=false, defaultValue="1") int page) {
		boolean flag = topService.delete(tops);
		return flag ? "ok" : null;
	}

	/**
	 * 类目列表
	 * 
	 * @return
	 */
	@RequestMapping("/typeList")
	public String typeList(HttpServletRequest request) {
		request.setAttribute("flag", 4);
		request.setAttribute("pa", "type_list");
		request.setAttribute("typeList", typeService.getList());
		return "/admin/index.jsp";
	}
	
	/**
	 * 通过名字获取列表
	 * 
	 * @return
	 */
	@RequestMapping("/typeSearch")
	public String typeSearch(String name,HttpServletRequest request) {
		request.setAttribute("flag", 4);
		request.setAttribute("pa", "type_list");
		request.setAttribute("typeList", typeService.getList(name));
		return "/admin/index.jsp";
	}

	/**
	 * 类目添加
	 * 
	 * @return
	 */
	@RequestMapping("/typeSave")
	public String typeSave(Types type, 
			@RequestParam(required=false, defaultValue="1") int page) {
		typeService.add(type);
		return "redirect:typeList?flag=4&page="+page;
	}

	/**
	 * 类目更新
	 * 
	 * @return
	 */
	@RequestMapping("/typeEdit")
	public String typeUp(int id, HttpServletRequest request) {
		request.setAttribute("flag", 4);
		request.setAttribute("pa", "type_edit");
		request.setAttribute("type", typeService.get(id));
		return "/admin/index.jsp";
	}

	/**
	 * 类目更新
	 * 
	 * @return
	 */
	@RequestMapping("/typeUpdate")
	public String typeUpdate(Types type, 
			@RequestParam(required=false, defaultValue="1") int page) {
		typeService.update(type);
		return "redirect:typeList?flag=4&page="+page;
	}

	/**
	 * 类目删除
	 * 
	 * @return
	 */
	@RequestMapping("/typeDelete")
	public String typeDelete(Types type, 
			@RequestParam(required=false, defaultValue="1") int page) {
		typeService.delete(type);
		return "redirect:typeList?flag=4&page="+page;
	}
	
	/**
     * 管理员列表
     * 
     * @return
     */
    @RequestMapping("/adminList")
    public String adminList(HttpServletRequest request, 
    		@RequestParam(required=false, defaultValue="1") int page) {
    	request.setAttribute("flag", 5);
    	request.setAttribute("pa", "admin_list");
    	request.setAttribute("adminList", adminService.getList(page, rows));
    	request.setAttribute("pageTool", PageUtil.getPageTool(request, adminService.getTotal(), page, rows));
    	return "/admin/index.jsp";
    }
    
	/**
	 * 通过名称搜索列表
	 * 
	 * @return
	 */
	@RequestMapping("/adminSearch")
	public String adminSearch(String name, HttpServletRequest request) {
		request.setAttribute("flag", 2);
		request.setAttribute("adminList", adminService.getListByName(name));
		request.setAttribute("pa", "admin_list");
		return "/admin/index.jsp";
	}

    /**
     * 管理员修改自己密码
     * 
     * @return
     */
    @RequestMapping("/adminRe")
    public String adminRe(HttpServletRequest request, HttpSession session) {
    	request.setAttribute("flag", 5);
    	request.setAttribute("pa", "admin_reset");
    	request.setAttribute("admin", adminService.getByUsername(String.valueOf(session.getAttribute("username"))));
    	return "/admin/index.jsp";
    }

    /**
     * 管理员修改自己密码
     * 
     * @return
     */
    @RequestMapping("/adminReset")
    public String adminReset(Admins admin, HttpServletRequest request) {
    	request.setAttribute("flag", 5);
    	if (adminService.get(admin.getId()).getPassword().equals(admin.getPassword())) {
    		admin.setPassword(admin.getPasswordNew());
    		adminService.update(admin);
    		request.setAttribute("admin", admin);
    		request.setAttribute("msg", "修改成功!");
    	}else {
    		request.setAttribute("admin", admin);
    		request.setAttribute("msg", "原密码错误!");
    	}
    	request.setAttribute("pa", "admin_reset");
    	return "/admin/index.jsp";
    }

	/**
	 * 用户添加
	 * 
	 * @return
	 */
	@RequestMapping("/adminAdd")
	public String adminAdd(HttpServletRequest request) {
		request.setAttribute("flag", 2);
		request.setAttribute("pa", "admin_list_add");
		return "/admin/index.jsp";
	}
	
    /**
     * 管理员添加
     * 
     * @return
     */
    @RequestMapping("/adminSave")
    public String adminSave(Admins admin, HttpServletRequest request, 
			@RequestParam(required=false, defaultValue="1") int page) {
    	if (adminService.isExist(admin.getUsername())) {
    		request.setAttribute("msg", "用户名已存在!");
    		return "/admin/admin_add.jsp";
    	}
    	adminService.add(admin);
    	return "redirect:adminList?flag=5&page="+page;
    }

    /**
     * 管理员修改
     * 
     * @return
     */
    @RequestMapping("/adminEdit")
    public String adminEdit(int id, HttpServletRequest request) {
    	request.setAttribute("flag", 5);
    	request.setAttribute("admin", adminService.get(id));
    	request.setAttribute("pa", "admin_edit");
    	return "/admin/index.jsp";
    }

    /**
     * 管理员更新
     * 
     * @return
     */
	@RequestMapping("/adminUpdate")
	public String adminUpdate(Admins admin, 
    		@RequestParam(required=false, defaultValue="1") int page) {
    	admin.setPassword(admin.getPassword());
    	adminService.update(admin);
		return "redirect:adminList?flag=5&page="+page;
    }

	/**
     * 管理员更新
     * 
     * @return
     */
	@RequestMapping("/adminUpdate2")
	public String adminUpdate2(Admins admin, 
    		@RequestParam(required=false, defaultValue="1") int page) {
    	admin.setPassword(admin.getPassword());
    	adminService.update(admin);
		return "redirect:person";
    }
	
    /**
     * 管理员删除
     * 
     * @return
     */
    @RequestMapping("/adminDelete")
    public String adminDelete(Admins admin, 
    		@RequestParam(required=false, defaultValue="1") int page) {
    	adminService.delete(admin);
    	return "redirect:adminList?flag=5&page="+page;
    }

    
    
    /**
     * 个人信息
     * 
     * @return
     */
    @RequestMapping("/person")
    public String person(HttpServletRequest request) {
    	String username = (String) request.getSession().getAttribute("username");
    	request.setAttribute("flag", 111);
    	request.setAttribute("admin", adminService.getByUsername(username));
    	request.setAttribute("pa", "person");
    	return "/admin/index.jsp";
    }

	/**
	 * 报表
	 * 
	 * @return
	 */
	@RequestMapping("/bb")
	public String memberAdd(HttpServletRequest request) {
		int adminId = (int) request.getSession().getAttribute("adminId");
		//request.setAttribute("flag", 2);
		request.setAttribute("pa", "bb");
		request.setAttribute("bbxx", JSON.toJSON(orderService.getBB(adminId)));
		return "/admin/index.jsp";
	}
	

}