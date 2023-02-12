//Profile controller should
// 1.Direct to Profile page
// 2.Update the profile info

package controller;

import dataAccess.UserDA;
import entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import utils.AlertUtil;
import utils.AuthUtil;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/Profile")
public class ProfileController {
    @GetMapping("")
    protected String getProfile(
        HttpServletRequest request
    ) {
        return "Profile";
    }
    @GetMapping("UpdateForm")
    protected String getUpdateProfile(
        HttpServletRequest request
    ) {
        return "UpdateProfile";
    }
    @PostMapping("UpdateProfile")
    protected String postUpdateProfile(
        HttpServletRequest request,
        RedirectAttributes redirect,
        @RequestParam("username") String username,
        @RequestParam("email") String email,
        @RequestParam("phone") String phone
    ) {
        User user = AuthUtil.getCurrentUser(request);
        user.setUsername(username);
        user.setEmail(email);
        user.setPhone(phone);
        UserDA.update(user);
        AlertUtil.setSuccessAlert(redirect, "Profile updated successfully!");
        return "redirect:/Profile";
    }


}
