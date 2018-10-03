package com.nicat.spring.LoggedIn;

import com.nicat.spring.Entity.User;

public class LoggedInUser {

    private static User user;

    public static User getUser() {
        return user;
    }

    public static void setUser(User user) {
        LoggedInUser.user = user;
    }
}
