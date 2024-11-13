/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.*;

/**
 *
 * @author Admin
 */
public class OrderDAO extends DBContext {

    public void insertOrder(User u, String notes, String address, String phone) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Cart> cl = new OrderDAO().getCartByuId(u.getId());
        try {
            String sql = "insert into [Order] ([user_id],[order_date],[total],[notes],[status],[address],[phone]) values (?,GETDATE(), ?, ?,1,?,?)";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, u.getId());
            ps.setDouble(2, new OrderDAO().getTotalPrice(u.getId()));
            ps.setString(3, notes);
            ps.setString(4, address);
            ps.setString(5, address);
            ps.executeUpdate();

            String sql1 = "select top 1 order_id from [Order] order by order_id desc";
            ps = connection.prepareStatement(sql1);
            rs = ps.executeQuery();

            if (rs.next()) {
                int oid = rs.getInt(1);
                for (Cart item : cl) {
                    String sql2 = "insert into [OrderDetail] ([order_id],[product_id]  ,[price],[quantity]) values (?,?, ?, ?)  update [Product] set [stock] = [stock] - ?  where product_id = ?   ";
                    ps = connection.prepareStatement(sql2);
                    ps.setInt(1, oid);
                    ps.setInt(2, item.getProduct().getId());
                    ps.setDouble(3, item.getProduct().getPrice());
                    ps.setInt(4, item.getQuantity());
                    ps.setInt(5, item.getQuantity());
                    ps.setInt(6, item.getProduct().getId());
                    ps.executeUpdate();
                }
            }
            deleteCart(u.getId());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addCart(int uid, String pid, String quantity) {
        String sql = "    insert into [Cart] ([uid] ,[pid] ,[quantity]) values (?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, uid);
            ps.setString(2, pid);
            ps.setString(3, quantity);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateCart(int uid, String pid, String quantity) {
        String sql = "    update [Cart] set [quantity]= ? where [uid] = ? and [pid] = ?    ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, quantity);
            ps.setInt(2, uid);
            ps.setString(3, pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteCartItem(int uid, String pid) {
        String sql = "   delete [Cart] where [uid] = ? and [pid] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, uid);
            ps.setString(2, pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteCart(int uid) {
        String sql = "   delete [Cart] where [uid] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, uid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Cart checkExist(int uid, String pid) {
        String sql = "   select * from [Cart] c, Product p\n"
                + "  where c.[pid] = p.product_id and c.[uid] = ? and c.[pid] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, uid);
            ps.setString(2, pid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cart c = new Cart(rs.getInt(1), rs.getInt(2), rs.getInt(3));
                Product p = new Product();
                p.setId(rs.getInt(4));
                p.setName(rs.getString(5));
                p.setImg(rs.getString(9));
                p.setPrice(rs.getDouble(6));
                c.setProduct(p);
                return c;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public static void main(String[] args) {
        Cart c = new OrderDAO().checkExist(6, "15");
        System.out.println(c);
    }

    public ArrayList<Cart> getCartByuId(int uid) {
        ArrayList<Cart> ol = new ArrayList<>();
        String sql = "   select * from [Cart] c, Product p\n"
                + "  where c.[pid] = p.product_id and c.[uid] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, uid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cart c = new Cart(rs.getInt(1), rs.getInt(2), rs.getInt(3));
                Product p = new Product();
                p.setId(rs.getInt(4));
                p.setName(rs.getString(5));
                p.setImg(rs.getString(9));
                p.setPrice(rs.getDouble(6));
                c.setProduct(p);
                ol.add(c);
            }
        } catch (Exception e) {
        }
        return ol;
    }

    public double getTotalPrice(int uid) {
        String sql = "    select sum(p.price*[quantity]) from Cart c join Product p on c.pid = p.product_id\n"
                + "  where c.[uid] = ?\n"
                + "  group by c.[uid]";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, uid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public ArrayList<Order> getAllOrderByuId(int uid) {
        ArrayList<Order> ol = new ArrayList<>();
        String sql = "  select * from [Order] where user_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, uid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ol.add(new Order(rs.getInt(1), new User(rs.getInt(2)), rs.getDate(3), rs.getDouble(4), rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return ol;
    }

    public ArrayList<OrderDetail> getAllOrderDetailByoId(int oid) {
        ArrayList<OrderDetail> odl = new ArrayList<>();
        String sql = " SELECT  p.*, o.* FROM [OrderDetail] o, Product p where o.product_id = p.product_id and o.order_id =?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, oid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getInt(4), new Category(rs.getInt("category_id")), rs.getString(6), rs.getString(7), rs.getDate(8), rs.getInt(9));
                odl.add(new OrderDetail(rs.getInt("detail_id"), rs.getInt("order_id"), p, rs.getDouble("price"), rs.getInt("quantity")));
            }
        } catch (Exception e) {
        }
        return odl;
    }

    public int getNumberOrder() {
        String sql = "  select count(*)from  OrderDetail";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public double getTotalProfit() {
        String sql = "  select sum(price*quantity) from OrderDetail";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }
    public ArrayList<Order> getAllOrderByuId(int uid, String fdate, String tdate) {
        ArrayList<Order> ol = new ArrayList<>();
        String sql = "  select * from [Order] where user_id = ? and [order_date] between ? and ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, uid);
            ps.setString(2, fdate);
            ps.setString(3, tdate);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ol.add(new Order(rs.getInt(1), new User(rs.getInt(2)), rs.getDate(3), rs.getDouble(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8)));
            }
        } catch (Exception e) {
        }
        return ol;
    }
}
