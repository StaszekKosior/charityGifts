package pl.coderslab.charity.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.Category;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/form")
public class DonationController {

    private final DonationRepository donationRepository;
    private final CategoryRepository categoryRepository;
    private final InstitutionRepository institutionRepository;
    private final HttpSession session;

    @GetMapping(value = "")
    public String donationForm(Model model) {
        model.addAttribute("donation", new Donation());
        return "form/form";
    }

    @PostMapping(value = "")
    public String addDonation(@Valid @ModelAttribute Donation donation, BindingResult result){
        if (result.hasErrors()) {
            return "form/form";
        }
        session.setAttribute("donation", donation);

        return "/form/form-summary";
    }
    @GetMapping(value = "/confirm")
    public String confirmDonation(){
        donationRepository.save((Donation) session.getAttribute("donation"));
        return "/form/form-confirmation";
    }

    @ModelAttribute("categories")
    public List<Category> categories(){
        return categoryRepository.findAll();
    }

    @ModelAttribute("institutions")
    public List<Institution> institutions(){
        return institutionRepository.findAll();
    }

}
