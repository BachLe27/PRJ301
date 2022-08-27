/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author bachl
 */
public class Location {
    private int id;
    private String name;
    private int numOfGuard;

    public Location() {
    }

    public Location(int id, String name, int numOfGuard) {
        this.id = id;
        this.name = name;
        this.numOfGuard = numOfGuard;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getNumOfGuard() {
        return numOfGuard;
    }

    public void setNumOfGuard(int numOfGuard) {
        this.numOfGuard = numOfGuard;
    }
    
    
}
