package interceptor;


import dataAccess.UserDA;
import entity.User;
import enums.UserType;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;


// Not an interceptor, but rather a bean responsible for initializing the application
@Component
public class ApplicationInit {

    @PostConstruct
    public void init() {
        initAdmin();
    }



    private void initAdmin() {
        User u = UserDA.getByUsername("admin");
        if (u != null) return;

        u = new User();
        u.setUsername("admin");
        u.setPassword("admin");
        u.setUserType(UserType.ADMIN);
        u.setEmail("admin@email.com");
        u.setPhone("1234567890");

        UserDA.add(u);
    }
}
