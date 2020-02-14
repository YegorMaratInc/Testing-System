package ru.licpnz.testingsystem.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import ru.licpnz.testingsystem.repositories.ContestRepository;

/**
 * 28/11/2019
 * ContestPanel
 *
 * @author havlong
 * @version 1.0
 */
@Controller
public class ContestPanelController {
    private final ContestRepository contestRepository;


    public ContestPanelController(ContestRepository contestRepository) {
        this.contestRepository = contestRepository;
    }

    @GetMapping("/contestPanel")
    public String getContestPanelPage(ModelMap modelMap) {
        modelMap.addAttribute("contests", contestRepository.findAll());
        return "contestPanel";
    }
}
