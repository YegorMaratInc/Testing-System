package ru.licpnz.testingsystem.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import ru.licpnz.testingsystem.exceptions.NotFoundException;
import ru.licpnz.testingsystem.models.*;
import ru.licpnz.testingsystem.repositories.ContestRepository;
import ru.licpnz.testingsystem.repositories.ProblemRepository;
import ru.licpnz.testingsystem.repositories.SubmissionRepository;
import ru.licpnz.testingsystem.repositories.UserRepository;
import ru.licpnz.testingsystem.transfer.ProblemDTO;
import ru.licpnz.testingsystem.transfer.ScoreboardDTO;

import java.util.*;

/**
 * 28/11/2019
 * ScoreboardController
 *
 * @author havlong
 * @version 1.0
 */
@Controller
public class ScoreboardController {

    private final SubmissionRepository submissionRepository;

    private final ContestRepository contestRepository;

    private final UserRepository userRepository;

    private final ProblemRepository problemRepository;

    public ScoreboardController(SubmissionRepository submissionRepository, ContestRepository contestRepository, UserRepository userRepository, ProblemRepository problemRepository) {
        this.submissionRepository = submissionRepository;
        this.contestRepository = contestRepository;
        this.userRepository = userRepository;
        this.problemRepository = problemRepository;
    }

    @GetMapping("/scoreboard/{contestId}")
    public String getScoreboardPage(@PathVariable("contestId") Long contestId, ModelMap modelMap) {
        Contest contest = contestRepository.findById(contestId).orElseThrow(NotFoundException::new);
        modelMap.addAttribute("contest", contest);
        Map<User, List<ProblemDTO>> scoreboard = new HashMap<>();
        List<User> users = userRepository.findAll();
        List<Problem> problems = problemRepository.findAllByContest(contest);
        users.forEach(user -> {
            scoreboard.put(user, new ArrayList<>());
            problems.forEach(problem -> {
                List<Submission> userSubmissions = submissionRepository.
                        findAllByOwnerAndProblemOrderBySubmissionTime(user, problem);
                int i = 0;
                for (; i < userSubmissions.size(); i++) {
                    if (userSubmissions.get(i).getState().equals(SubmissionState.OK))
                        break;
                }
                if (i == userSubmissions.size())
                    scoreboard.get(user).add(new ProblemDTO(userSubmissions.size(), 0, false, problem.getShortName()));
                else if (userSubmissions.size() == 0)
                    scoreboard.get(user).add(new ProblemDTO(0, 0, false, problem.getShortName()));
                else {
                    int difference = userSubmissions.size() * 10 - 10;
                    Date userTime = userSubmissions.get(i).getSubmissionTime();
                    difference += (int) ((userTime.getTime() - contest.getStartTime().getTime()) / 60000);
                    scoreboard.get(user).add(new ProblemDTO(i + 1, difference, true, problem.getShortName()));
                }
            });
        });
        List<ScoreboardDTO> score = new ArrayList<>();
        scoreboard.forEach((user, problemDTOS) -> {
            int total = 0;
            int solved = 0;
            for (ProblemDTO problemDTO : problemDTOS) {
                total += problemDTO.getTimeAdded();
                solved += problemDTO.isSolved() ? 1 : 0;
            }
            problemDTOS.sort(Comparator.comparing(ProblemDTO::getProblemShortName));
            score.add(new ScoreboardDTO(problemDTOS, user, total, solved));
        });
        score.sort((s1, s2) -> {
            if (s1.getCount() != s2.getCount())
                return s2.getCount() - s1.getCount();
            return s1.getTotal() - s2.getTotal();
        });
        modelMap.addAttribute("problems", problems);
        problems.sort(Comparator.comparing(Problem::getShortName));
        modelMap.addAttribute("scoreboard", score);
        return "scoreboard";
    }
}
