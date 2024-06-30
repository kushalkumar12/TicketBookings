package com.work;

public class ManagerFactory {
    public static Object getManagerInstance(String managerBean) {
        Object myClass = null;
        try {
            myClass = Class.forName(managerBean).getDeclaredConstructor().newInstance();
        } catch (Exception e) {
            e.printStackTrace(); // Print the exception for debugging purposes
        }
        return myClass;
    }
}