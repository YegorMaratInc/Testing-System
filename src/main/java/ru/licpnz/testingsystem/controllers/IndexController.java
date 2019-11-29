package ru.licpnz.testingsystem.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import ru.licpnz.testingsystem.repositories.ContestRepository;

import java.util.Calendar;
import java.util.Date;

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
    public String getContestsPage(ModelMap modelMap) {
        modelMap.addAttribute("contests",
                contestRepository.findAll()
                        .stream().filter(
                        contest -> {
                            Date time = Calendar.getInstance().getTime();
                            return time.after(contest.getStartTime()) && time.before(contest.getFinishTime());
                        }
                )
        );
        return "index";
    }
}
