package utils;


import dataAccess.UserDA;
import entity.User;

import javax.servlet.http.HttpServletRequest;

public class AuthUtil {

    private AuthUtil() {}

    // Returns the user object if the user is logged in, otherwise returns null
    public static User getCurrentUser(HttpServletRequest request) {
        return (User) request.getSession().getAttribute("user");
    }

    public static User logIn(
        HttpServletRequest request,
        String emailUsername,
        String password,
        boolean remember
    ) throws Exception {
        User user = UserDA.getByUsername(emailUsername);
        if (user == null) user = UserDA.getByEmail(emailUsername);

        if (user == null) throw new Exception("User " + emailUsername + " does not exist");
        if (!user.getPassword().equals(password)) throw new Exception("Incorrect password");

        request.getSession().setAttribute("user", user);
        if (remember) request.getSession().setMaxInactiveInterval(60 * 60 * 24 * 7);    // 7 days if remember is true
        return user;
    }

    public static void logOut(HttpServletRequest request) {
        request.getSession().removeAttribute("user");
    }

    public static void register(User user) {
        UserDA.add(user);
    }
}
