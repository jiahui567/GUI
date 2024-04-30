/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.io.Serializable;
import jakarta.persistence.Basic;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.Table;
import jakarta.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author User
 */
@Entity
@Table(name = "CART_ITEM")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CartItem.findAll", query = "SELECT c FROM CartItem c"),
    @NamedQuery(name = "CartItem.findByCartItemid", query = "SELECT c FROM CartItem c WHERE c.cartItemid = :cartItemid"),
    @NamedQuery(name = "CartItem.findByQuantity", query = "SELECT c FROM CartItem c WHERE c.quantity = :quantity"),
    @NamedQuery(name = "CartItem.findByCartId", query = "SELECT c FROM CartItem c WHERE c.cartId = :cartId")})
public class CartItem implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "CART_ITEMID")
    private Integer cartItemid;
    @Basic(optional = false)
    @Column(name = "QUANTITY")
    private int quantity;
    @JoinColumn(name = "CART_ID", referencedColumnName = "CART_ID")
    @ManyToOne
    private Cart cartId;
    @JoinColumn(name = "PRODUCTID", referencedColumnName = "PRODUCT_ID")
    @ManyToOne(optional = false)
    private Products productid;

    public CartItem() {
    }

    public CartItem(Integer cartItemid) {
        this.cartItemid = cartItemid;
    }

    public CartItem(Integer cartItemid, int quantity) {
        this.cartItemid = cartItemid;
        this.quantity = quantity;
    }

    public Integer getCartItemid() {
        return cartItemid;
    }

    public void setCartItemid(Integer cartItemid) {
        this.cartItemid = cartItemid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Cart getCartId() {
        return cartId;
    }

    public void setCartId(Cart cartId) {
        this.cartId = cartId;
    }

    public Products getProductid() {
        return productid;
    }

    public void setProductid(Products productid) {
        this.productid = productid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cartItemid != null ? cartItemid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CartItem)) {
            return false;
        }
        CartItem other = (CartItem) object;
        if ((this.cartItemid == null && other.cartItemid != null) || (this.cartItemid != null && !this.cartItemid.equals(other.cartItemid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.CartItem[ cartItemid=" + cartItemid + " ]";
    }
    
}
