package domain;

import java.util.HashMap;
import java.util.Map;

public class Cart {
	private double total;
	//���ﳵ�е����й������
	private Map<String,CartItem> cartItems = new HashMap<String,CartItem>();
	
	public Map<String, CartItem> getCartItems() {
		return cartItems;
	}
	public void setCartItems(Map<String, CartItem> cartItems) {
		this.cartItems = cartItems;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public Cart() {
	}
	//���ﳵ����Ʒ�ܼ�

    
    //getter,setter��
}

