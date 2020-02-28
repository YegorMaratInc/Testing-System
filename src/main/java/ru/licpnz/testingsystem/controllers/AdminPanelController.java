package ru.licpnz.testingsystem.controllers;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import ru.licpnz.testingsystem.exceptions.NotFoundException;
import ru.licpnz.testingsystem.forms.ContestForm;
import ru.licpnz.testingsystem.forms.ProblemForm;
import ru.licpnz.testingsystem.models.Contest;
import ru.licpnz.testingsystem.models.Problem;
import ru.licpnz.testingsystem.models.UserRole;
import ru.licpnz.testingsystem.repositories.ContestRepository;
import ru.licpnz.testingsystem.repositories.ProblemRepository;
import ru.licpnz.testingsystem.security.details.UserDetailsImpl;

import java.util.Calendar;
import java.util.Date;

@Controller
public class AdminPanelController {
    private final ProblemRepository problemRepository;
    private final ContestRepository contestRepository;

    public AdminPanelController(ProblemRepository problemRepository, ContestRepository contestRepository) {
        this.problemRepository = problemRepository;
        this.contestRepository = contestRepository;
    }

    @PostMapping("/create")
    public String postContestPage(ContestForm contestForm, Authentication authentication) {
        //if (((UserDetailsImpl) authentication.getPrincipal()).getUser().getUserRole() != UserRole.ADMIN)
        //    return "redirect:/"; на время теста
        //спросить как сделать так, чтобы кидало со страницы сразу
        String start = contestForm.getStartTime();
        String finish = contestForm.getFinishTime();
        //2020-02-25T00:00
        int year = Integer.parseInt(start.substring(0, 4));
        int month = Integer.parseInt(start.substring(5, 7));
        int day = Integer.parseInt(start.substring(8, 10));
        int hour = Integer.parseInt(start.substring(11, 13));
        int minute = Integer.parseInt(start.substring(14, 16));
        Date startTime = new Date(year - 1900, month - 1, day, hour, minute);

        year = Integer.parseInt(finish.substring(0, 4));
        month = Integer.parseInt(finish.substring(5, 7));
        day = Integer.parseInt(finish.substring(8, 10));
        hour = Integer.parseInt(finish.substring(11, 13));
        minute = Integer.parseInt(finish.substring(14, 16));
        Date finishTime = new Date(year - 1900, month - 1, day, hour, minute);
        Contest contest = Contest.builder()
                .title(contestForm.getTitle())
                .finishTime(finishTime)
                .startTime(startTime)
                .build();
        contestRepository.save(contest);

        return "redirect:/";
    }

    @PostMapping("/create/contest/{contestId}")
    public String postProblemPage(@PathVariable Long contestId, ProblemForm problemForm, Authentication authentication) {
        //if (((UserDetailsImpl) authentication.getPrincipal()).getUser().getUserRole() != UserRole.ADMIN)
        //    return "redirect:/contest/" + contestId; на время теста
        System.out.println(((UserDetailsImpl) authentication.getPrincipal()).getUser().getUserRole());
        Problem problem = Problem.builder()
                .contest(contestRepository.findById(contestId).orElseThrow(NotFoundException::new))
                .content(problemForm.getContent())
                .inputFormat(problemForm.getInputFormat())
                .outputFormat(problemForm.getOutputFormat())
                .name(problemForm.getName())
                .shortName(problemForm.getShortName())
                .timeLimit(problemForm.getTimeLimit())
                .build();
        problemRepository.save(problem);

        return "redirect:/contest/" + contestId;
    }

    @GetMapping("/create")
    public String getCreateContestPage() {
        return "createContestPanel";
    }

    @GetMapping("/create/contest/{contestId}")
    public String getCreateProblemPage(@PathVariable Long contestId) {
        return "createProblemPanel";
    }


}
