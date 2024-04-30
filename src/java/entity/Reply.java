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
@Table(name = "REPLY")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Reply.findAll", query = "SELECT r FROM Reply r"),
    @NamedQuery(name = "Reply.findByReplyId", query = "SELECT r FROM Reply r WHERE r.replyId = :replyId"),
    @NamedQuery(name = "Reply.findByComment", query = "SELECT r FROM Reply r WHERE r.comment = :comment"),
    @NamedQuery(name = "Reply.findByTime", query = "SELECT r FROM Reply r WHERE r.time = :time")})
public class Reply implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "REPLY_ID")
    private Integer replyId;
    @Basic(optional = false)
    @Column(name = "COMMENT")
    private String comment;
    @Column(name = "TIME")
    @Temporal(TemporalType.TIMESTAMP)
    private Date time;
    @JoinColumn(name = "LOG_ID", referencedColumnName = "LOG_ID")
    @ManyToOne
    private Feedbacklog logId;
    @JoinColumn(name = "USER_ID", referencedColumnName = "USER_ID")
    @ManyToOne
    private Users userId;

    public Reply() {
    }

    public Reply(Integer replyId) {
        this.replyId = replyId;
    }

    public Reply(Integer replyId, String comment) {
        this.replyId = replyId;
        this.comment = comment;
    }

    public Integer getReplyId() {
        return replyId;
    }

    public void setReplyId(Integer replyId) {
        this.replyId = replyId;
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

    public Feedbacklog getLogId() {
        return logId;
    }

    public void setLogId(Feedbacklog logId) {
        this.logId = logId;
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
        hash += (replyId != null ? replyId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Reply)) {
            return false;
        }
        Reply other = (Reply) object;
        if ((this.replyId == null && other.replyId != null) || (this.replyId != null && !this.replyId.equals(other.replyId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Reply[ replyId=" + replyId + " ]";
    }
    
}
