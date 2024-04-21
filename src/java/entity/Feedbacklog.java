/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.io.Serializable;
import java.util.Date;
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
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author User
 */
@Entity
@Table(name = "FEEDBACKLOG")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Feedbacklog.findAll", query = "SELECT f FROM Feedbacklog f"),
    @NamedQuery(name = "Feedbacklog.findByLogId", query = "SELECT f FROM Feedbacklog f WHERE f.logId = :logId"),
    @NamedQuery(name = "Feedbacklog.findByRating", query = "SELECT f FROM Feedbacklog f WHERE f.rating = :rating"),
    @NamedQuery(name = "Feedbacklog.findByComment", query = "SELECT f FROM Feedbacklog f WHERE f.comment = :comment"),
    @NamedQuery(name = "Feedbacklog.findByTime", query = "SELECT f FROM Feedbacklog f WHERE f.time = :time")})
public class Feedbacklog implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "LOG_ID")
    private Integer logId;
    @Basic(optional = false)
    @Column(name = "RATING")
    private String rating;
    @Basic(optional = false)
    @Column(name = "COMMENT")
    private String comment;
    @Column(name = "TIME")
    @Temporal(TemporalType.TIMESTAMP)
    private Date time;
    @JoinColumn(name = "USER_ID", referencedColumnName = "USER_ID")
    @ManyToOne(optional = false)
    private Users userId;

    public Feedbacklog() {
    }

    public Feedbacklog(Integer logId) {
        this.logId = logId;
    }

    public Feedbacklog(Integer logId, String rating, String comment) {
        this.logId = logId;
        this.rating = rating;
        this.comment = comment;
    }

    public Integer getLogId() {
        return logId;
    }

    public void setLogId(Integer logId) {
        this.logId = logId;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Users getUserId() {
        return userId;
    }

    public void setUserId(Users userId) {
        this.userId = userId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (logId != null ? logId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Feedbacklog)) {
            return false;
        }
        Feedbacklog other = (Feedbacklog) object;
        if ((this.logId == null && other.logId != null) || (this.logId != null && !this.logId.equals(other.logId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Feedbacklog[ logId=" + logId + " ]";
    }
    
}
