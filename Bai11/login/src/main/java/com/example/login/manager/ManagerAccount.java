package com.example.login.manager;

import com.example.login.model.Account;

import java.util.ArrayList;
import java.util.List;

public class ManagerAccount {
    static List<Account> accountList = new ArrayList<>();
    static {
        accountList.add(new Account("A","B","Male","123456789","a@gmail.com","0123"));
    }

    public void addAccount(String fistName, String lastName, String gender, String phone, String email, String password) {
        accountList.add(new Account(fistName, lastName, gender, phone, email, password));
    }

    public Account findAccount(String email, String password) {
        for (int i = 0; i < accountList.size(); i++) {
            if (accountList.get(i).getEmail().equals(email) && accountList.get(i).getPassword().equals(password)) {
                return accountList.get(i);
            }
        }
        return null;
    }

    public boolean checkEmail(String email) {
        for (int i = 0; i < accountList.size(); i++) {
            if (accountList.get(i).getEmail().equals(email)) {
                return true;
            }
        }
        return false;
    }
}
