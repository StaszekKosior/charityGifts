package pl.coderslab.charity.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class HomeController {

    private final DonationRepository donationRepository;
    private final InstitutionRepository institutionRepository;


    @RequestMapping("/")
    public String homeAction(Model model){

        return "index";
    }
    @ModelAttribute("allBagsQuantity")
    public Integer allBagsQuantity(){

        return donationRepository.countAllBags();
    }

    @ModelAttribute("allDonationsQuantity")
    public Integer allDonationsQuantity(){
        return donationRepository.countAll();
    }

    @ModelAttribute("institutionsList")
    public List<Institution> institutionsList(){
        return institutionRepository.findAll();
    }
    @ModelAttribute("institutionsListSize")
    public Integer institutionsListSize(){
        return institutionRepository.findAll().size();
    }


}
