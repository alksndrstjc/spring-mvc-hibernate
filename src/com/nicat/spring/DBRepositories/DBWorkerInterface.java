package com.nicat.spring.DBRepositories;

import com.nicat.spring.Entity.User;

public interface DBWorkerInterface {

    User getUserByUsername(String username);
}
