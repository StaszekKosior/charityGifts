package pl.coderslab.charity.controller;

import lombok.AllArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.UserRepository;
import pl.coderslab.charity.service.UserService;
import javax.validation.Valid;


@Controller
@AllArgsConstructor
@RequestMapping("/user")
public class UserController {
    private final UserService userService;

    @GetMapping(value = "/login")
    public String login(User user, Model model) {
        model.addAttribute("user", user);
        return "user/login";
    }
    @PostMapping(value = "/logout")
    public String logout() {


        return "redirect:/";
    }



    @GetMapping(value = "/register")
    public String register(Model model) {
        model.addAttribute("user", new User());
        return "user/register";
    }

    @PostMapping(value = "/register")
    public String register(@Valid @ModelAttribute User user, BindingResult result, @RequestParam(required = false) String passwordConfirm) {

        if (user.getEmail() != null && userService.findByEmail(user.getEmail()).isPresent()) {
            result.addError(new FieldError("user", "email", "Istnieje użytkownik o wskazanym adresie"));

        }
        if (passwordConfirm != null && user.getPassword() != null && !passwordConfirm.equals(user.getPassword())) {
            result.addError(new FieldError("user", "password", "Wprowadzono różne hasła"));
        }
        if (result.hasErrors()) {
            return "user/register";
        }
        userService.saveUser(user);
        return "redirect:/user/login";
    }

}
