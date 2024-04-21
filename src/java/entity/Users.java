/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.io.Serializable;
import java.util.List;
import jakarta.persistence.Basic;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.xml.bind.annotation.XmlRootElement;
import jakarta.xml.bind.annotation.XmlTransient;

/**
 *
 * @author User
 */
@Entity
@Table(name = "USERS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Users.findAll", query = "SELECT u FROM Users u"),
    @NamedQuery(name = "Users.findByUserId", query = "SELECT u FROM Users u WHERE u.userId = :userId"),
    @NamedQuery(name = "Users.findByFullname", query = "SELECT u FROM Users u WHERE u.fullname = :fullname"),
    @NamedQuery(name = "Users.findByAge", query = "SELECT u FROM Users u WHERE u.age = :age"),
    @NamedQuery(name = "Users.findByGender", query = "SELECT u FROM Users u WHERE u.gender = :gender"),
    @NamedQuery(name = "Users.findByAddress", query = "SELECT u FROM Users u WHERE u.address = :address"),
    @NamedQuery(name = "Users.findByEmail", query = "SELECT u FROM Users u WHERE u.email = :email"),
    @NamedQuery(name = "Users.findByContactNumber", query = "SELECT u FROM Users u WHERE u.contactNumber = :contactNumber"),
    @NamedQuery(name = "Users.findByUsername", query = "SELECT u FROM Users u WHERE u.username = :username"),
    @NamedQuery(name = "Users.findByPassword", query = "SELECT u FROM Users u WHERE u.password = :password"),
    @NamedQuery(name = "Users.findAccount", query = "SELECT u FROM Users u WHERE u.username = :username AND u.password = :password"),

})
public class Users implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "USER_ID")
    private Integer userId;
    @Basic(optional = false)
    @Column(name = "FULLNAME")
    private String fullname;
    @Column(name = "AGE")
    private Integer age;
    @Column(name = "GENDER")
    private String gender;
    @Column(name = "ADDRESS")
    private String address;
    @Basic(optional = false)
    @Column(name = "EMAIL")
    private String email;
    @Basic(optional = false)
    @Column(name = "CONTACT_NUMBER")
    private String contactNumber;
    @Basic(optional = false)
    @Column(name = "USERNAME")
    private String username;
    @Basic(optional = false)
    @Column(name = "PASSWORD")
    private String password;
    @Lob
    @Column(name = "PROFILE_PIC")
    private Serializable profilePic;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userId")
    private List<Feedbacklog> feedbacklogList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userId")
    private List<Payment> paymentList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userId")
    private List<Orders> ordersList;
    @JoinColumn(name = "TYPE_ID", referencedColumnName = "TYPE_ID")
    @ManyToOne(optional = false)
    private UserType typeId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userId")
    private List<Transactions> transactionsList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userId")
    private List<Cart> cartList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userId")
    private List<Delivery> deliveryList;

    public Users() {
    }

    public Users(Integer userId) {
        this.userId = userId;
    }

    public Users(Integer userId, String fullname, String email, String contactNumber, String username, String password) {
        this.userId = userId;
        this.fullname = fullname;
        this.email = email;
        this.contactNumber = contactNumber;
        this.username = username;
        this.password = password;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Serializable getProfilePic() {
        return profilePic;
    }

    public void setProfilePic(Serializable profilePic) {
        this.profilePic = profilePic;
    }

    @XmlTransient
    public List<Feedbacklog> getFeedbacklogList() {
        return feedbacklogList;
    }

    public void setFeedbacklogList(List<Feedbacklog> feedbacklogList) {
        this.feedbacklogList = feedbacklogList;
    }

    @XmlTransient
    public List<Payment> getPaymentList() {
        return paymentList;
    }

    public void setPaymentList(List<Payment> paymentList) {
        this.paymentList = paymentList;
    }

    @XmlTransient
    public List<Orders> getOrdersList() {
        return ordersList;
    }

    public void setOrdersList(List<Orders> ordersList) {
        this.ordersList = ordersList;
    }

    public UserType getTypeId() {
        return typeId;
    }

    public void setTypeId(UserType typeId) {
        this.typeId = typeId;
    }

    @XmlTransient
    public List<Transactions> getTransactionsList() {
        return transactionsList;
    }

    public void setTransactionsList(List<Transactions> transactionsList) {
        this.transactionsList = transactionsList;
    }

    @XmlTransient
    public List<Cart> getCartList() {
        return cartList;
    }

    public void setCartList(List<Cart> cartList) {
        this.cartList = cartList;
    }

    @XmlTransient
    public List<Delivery> getDeliveryList() {
        return deliveryList;
    }

    public void setDeliveryList(List<Delivery> deliveryList) {
        this.deliveryList = deliveryList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (userId != null ? userId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Users)) {
            return false;
        }
        Users other = (Users) object;
        if ((this.userId == null && other.userId != null) || (this.userId != null && !this.userId.equals(other.userId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Users[ userId=" + userId + " ]";
    }
    
}
