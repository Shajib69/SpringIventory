package ac.dia.entity;

import java.util.ArrayList;
import java.util.Date;

public class Orders {

    private int orderId;
    private int cid;
    private double total;
    private String orderType;
    private Date orderDate;
    private ArrayList<OrderDetails> orderDetailses=new ArrayList<OrderDetails>();

    public ArrayList<OrderDetails> getOrderDetailses() {
        return orderDetailses;
    }

    public void setOrderDetailses(ArrayList<OrderDetails> orderDetailses) {
        this.orderDetailses = orderDetailses;
    }
    
    public Orders() {
    }

    public Orders(int orderId, int cid, double total, String orderType, Date orderDate) {
        this.orderId = orderId;
        this.cid = cid;
        this.total = total;
        this.orderType = orderType;
        this.orderDate = orderDate;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getOrderType() {
        return orderType;
    }

    public void setOrderType(String orderType) {
        this.orderType = orderType;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    @Override
    public String toString() {
        return "Orders{" + "orderId=" + orderId + ", cid=" + cid + ", total=" + total + ", orderType=" + orderType + ", orderDate=" + orderDate +" orders list "+ orderDetailses+"'}'";
    }

}
