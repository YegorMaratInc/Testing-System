package ru.licpnz.testingsystem.controllers;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import ru.licpnz.testingsystem.repositories.ContestRepository;
import ru.licpnz.testingsystem.security.details.UserDetailsImpl;

import java.util.Calendar;
import java.util.Date;
import java.util.stream.Collectors;

/**
 * 28/11/2019
 * IndexController
 *
 * @author havlong
 * @version 1.0
 */
@Controller
public class IndexController {

    private final ContestRepository contestRepository;

    public IndexController(ContestRepository contestRepository) {
        this.contestRepository = contestRepository;
    }

    @GetMapping("/")
    public String getContestsPage(ModelMap modelMap, Authentication authentication) {
        modelMap.addAttribute("contests",
                contestRepository.findAll()
                        .stream().filter(
                        contest -> {
                            Date time = Calendar.getInstance().getTime();
                            return time.after(contest.getStartTime()) && time.before(contest.getFinishTime());
                        }
                )
                        .collect(Collectors.toList())
        );
        modelMap.addAttribute("login", ((UserDetailsImpl) authentication.getPrincipal()).getUser().getLogin());
        return "index";
    }
}
