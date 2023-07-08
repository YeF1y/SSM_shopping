package com.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.entity.Items;

public interface ItemsDao {
    int deleteById(Integer id);

    int insert(Items record);

    int insertSelective(Items record);

    Items selectById(Integer id);

    int updateByIdSelective(Items record);

    int updateById(Items record);    
    
    // 以上为mybatis generator自动生成接口, 具体实现在mapper.xml中
    
    // ------------------------------------------------------------ 
    
    // 以下方法使用mybatis注解实现
    
	
	/**
	 * 订单项列表
	 * @param Ordersid
	 * @param page
	 * @param rows
	 * @return
	 */
    @Select("select * from items where order_id=#{orderid}")
	public List<Items> getItemList(int orderid);



	@Select("select sum(i.price*i.amount) as sm , i.good_Id, g.name from items i left join goods g on g.id=i.good_Id " +
			" where i.good_id in (select id from goods where adminId = #{adminId}) group by i.good_Id")
	public List<Map<String, Object>> getBB(@Param("adminId") int adminId);

	@Select("SELECT " +
			"(select IFNULL(sum(i.price*i.amount),0) from items i left join orders o on  o.id=i.order_id where year(now())=year(o.systime) and MONTH(o.systime) = 1 and i.good_id in (select id from goods where adminId = #{adminId}) ) AS 'Jan'," +
			"(select IFNULL(sum(i.price*i.amount),0) from items i left join orders o on  o.id=i.order_id where year(now())=year(o.systime) and MONTH(o.systime) = 2 and i.good_id in (select id from goods where adminId = #{adminId}) ) AS 'Feb'," +
			"(select IFNULL(sum(i.price*i.amount),0) from items i left join orders o on  o.id=i.order_id where year(now())=year(o.systime) and MONTH(o.systime) = 3 and i.good_id in (select id from goods where adminId = #{adminId}) ) AS 'Mar'," +
			"(select IFNULL(sum(i.price*i.amount),0) from items i left join orders o on  o.id=i.order_id where year(now())=year(o.systime) and MONTH(o.systime) = 4 and i.good_id in (select id from goods where adminId = #{adminId}) ) AS 'Apr'," +
			"(select IFNULL(sum(i.price*i.amount),0) from items i left join orders o on  o.id=i.order_id where year(now())=year(o.systime) and MONTH(o.systime) = 5 and i.good_id in (select id from goods where adminId = #{adminId}) ) AS 'May'," +
			"(select IFNULL(sum(i.price*i.amount),0) from items i left join orders o on  o.id=i.order_id where year(now())=year(o.systime) and MONTH(o.systime) = 6 and i.good_id in (select id from goods where adminId = #{adminId}) ) AS 'Jun'," +
			"(select IFNULL(sum(i.price*i.amount),0) from items i left join orders o on  o.id=i.order_id where year(now())=year(o.systime) and MONTH(o.systime) = 7 and i.good_id in (select id from goods where adminId = #{adminId}) ) AS 'Jul'," +
			"(select IFNULL(sum(i.price*i.amount),0) from items i left join orders o on  o.id=i.order_id where year(now())=year(o.systime) and MONTH(o.systime) = 8 and i.good_id in (select id from goods where adminId = #{adminId}) ) AS 'Aug'," +
			"(select IFNULL(sum(i.price*i.amount),0) from items i left join orders o on  o.id=i.order_id where year(now())=year(o.systime) and MONTH(o.systime) = 9 and i.good_id in (select id from goods where adminId = #{adminId}) ) AS 'Sep'," +
			"(select IFNULL(sum(i.price*i.amount),0) from items i left join orders o on  o.id=i.order_id where year(now())=year(o.systime) and MONTH(o.systime) = 10 and i.good_id in (select id from goods where adminId = #{adminId}) ) AS 'Oct'," +
			"(select IFNULL(sum(i.price*i.amount),0) from items i left join orders o on  o.id=i.order_id where year(now())=year(o.systime) and MONTH(o.systime) = 11 and i.good_id in (select id from goods where adminId = #{adminId}) ) AS 'Nov'," +
			"(select IFNULL(sum(i.price*i.amount),0) from items i left join orders o on  o.id=i.order_id where year(now())=year(o.systime) and MONTH(o.systime) = 12 and i.good_id in (select id from goods where adminId = #{adminId}) ) AS 'Dec';")
	public List<Map<String, Object>> getBB2(@Param("adminId") int adminId);
}