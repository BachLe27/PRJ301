package DAL;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author bachl
 */
import java.sql.*;
import Models.*;
import Utils.Encrypt;
import java.util.ArrayList;

public class DAO {

    protected Connection con;

    public String status = "";

    public ArrayList<Account> accounts;
    
    public DAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error Connection" + e.getMessage();
        }
    }

    public String getStatus() {
        return status;
    }
    
    public void loadAccount() {
        String sql = "select * from Account_HE163411";
        
        accounts = new ArrayList<>();
        
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String username = rs.getString(1).trim();
                String pass = rs.getString(2).trim();
                int role = rs.getInt(3);
                String email = rs.getString(4).trim();
                String name = rs.getString(5).trim();
                String phone = rs.getString(6).trim();
                boolean status = rs.getBoolean(7);
                accounts.add(new Account(username, pass, role, email, name, phone, status));
                
            } 
        } catch (Exception e) {
            status = "Error at load account: " + e.getMessage();
        }
    }
    
    public Account checkLogin(String username, String password) {
        String sql = "select * from Account_HE163411 where username=? and password=?";

        Account account = null;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, Encrypt.encode(password));
            
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String user = rs.getString(1).trim();
                String pass = rs.getString(2).trim();
                int role = rs.getInt(3);
                String email = rs.getString(4).trim();
                String name = rs.getString(5).trim();
                String phone = rs.getString(6).trim();
                boolean status = rs.getBoolean(7);
                
                account = new Account(username, password, role, email, name, phone, status);
                
            } 
        } catch (Exception e) {
            status = "Error at check login: " + e.getMessage();
        }
        
        return account;
    }

    public ArrayList<Account> getAccounts() {
        return accounts;
    }

    public void setAccounts(ArrayList<Account> accounts) {
        this.accounts = accounts;
    }

    public void updateAccount(Account modifiedAccount) {
        String sql = "update Account_HE163411 set name=?, phone=?, role=?, status=? where username=?" ;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, modifiedAccount.getName().trim());
            ps.setString(2, modifiedAccount.getPhone().trim());
            ps.setString(3, modifiedAccount.getRole() + "");
            ps.setString(4, modifiedAccount.isStatus() ? "1" : "0");
            ps.setString(5, modifiedAccount.getUsername());
            ps.execute();
        } catch (Exception e) {
            status = "Error at update account: " + e.getMessage();
        }
    }

    public Account checkAccountExist(String username, String email) {
        String sql = "select * from Account_HE163411 where username=? and email=?";
        
        Account account = null;
        
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, email);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                account = new Account(username, email);
            }
        } catch (Exception e) {
            status = "Error at update account: " + e.getMessage();
        }
        return account;
    }

    public void changePassword(String email, String newPassword) {
        String sql = "update Account_HE163411 set password=? where email=?"; 
        
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setString(2, email);
            ps.execute();
        } catch (Exception e) {
            status = "Error at update account: " + e.getMessage();
        }
        
    }

    public void updateNewPassword(String username, String newPassword) {
        String sql = "update Account_HE163411 set password=? where username=?"; 
        
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setString(2, username);
            ps.execute();
        } catch (Exception e) {
            status = "Error at update account password: " + e.getMessage();
        }
    }

    public void createAccount(Account account) {
        String sql = "insert into Account_HE163411 values(?, ?, ?, ?, ?, ?, ?)"; 
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, account.getUsername());
            ps.setString(2, account.getPassword());
            ps.setString(3, account.getRole() + "");
            ps.setString(4, account.getEmail());
            ps.setString(5, account.getName());
            ps.setString(6, account.getPhone());
            ps.setString(7, account.isStatus() ? "1" : "0");
            ps.execute();
        } catch (Exception e) {
            status = "Error at update account password: " + e.getMessage();
        }
    }

    public int checkExist(String username, String email) {
        String sql = "select * from Account_HE163411 where username=?";
         
        String sql2 = "select * from Account_HE163411 where email=?";
        
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                return 1;
            }
            
            ps = con.prepareStatement(sql2);
            ps.setString(1, email);
            
            rs = ps.executeQuery();
            
            if (rs.next()) {
                return 2;
            }
            
        } catch (Exception e) {
        
        }
        
        return 3;
    }

    public void updateName(String username, String name) {
        String sql = "update Account_HE163411 set name=? where username=?";
        
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setString(1, name);
            ps.setString(2, username);
            
            ps.execute();
        } catch (Exception e) {
            status = "Error!";
        }
    }

    public void updatePhone(String username, String phone) {
        String sql = "update Account_HE163411 set phone=? where username=?";
        
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setString(1, phone);
            ps.setString(2, username);
            
            ps.execute();
        } catch (Exception e) {
            status = "Error!";
        }}

    public void deleteAccount(String username) {
        String sql = "delete from Account_HE163411 where username=?";
        
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setString(1, username);
            
            ps.execute();
        } catch (Exception e) {
            status = "Error!";
        }
    }
    
}
