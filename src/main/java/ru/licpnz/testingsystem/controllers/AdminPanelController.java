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
import ru.licpnz.testingsystem.repositories.ContestRepository;
import ru.licpnz.testingsystem.repositories.ProblemRepository;
import ru.licpnz.testingsystem.security.details.UserDetailsImpl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
    public String postContestPage(ContestForm contestForm, Authentication authentication) throws ParseException {
        String start = contestForm.getStartTime();
        String finish = contestForm.getFinishTime();
        //2020-02-25T00:00
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-ddTHH:mm");

        Date startTime = format.parse(start);
        Date finishTime = format.parse(finish);

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
