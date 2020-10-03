package ac.dia.entity;

public class OrderDetails {

    private int orderDetailId;
    private int orderId;
    private int pid;
    private int qty;
    private double price;
    private double subTotal;

    public OrderDetails() {
    }

    public OrderDetails(int orderDetailId, int orderId, int pid, int qty, double price, double subTotal) {
        this.orderDetailId = orderDetailId;
        this.orderId = orderId;
        this.pid = pid;
        this.qty = qty;
        this.price = price;
        this.subTotal = subTotal;
    }

    public int getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(int orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(double subTotal) {
        this.subTotal = subTotal;
    }

    @Override
    public String toString() {
        return "OrderDetails{" + "orderDetailId=" + orderDetailId + ", orderId=" + orderId + ", pid=" + pid + ", qty=" + qty + ", price=" + price + ", subTotal=" + subTotal + '}';
    }

}
