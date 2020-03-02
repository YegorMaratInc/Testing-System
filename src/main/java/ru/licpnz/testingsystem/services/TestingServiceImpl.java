package ru.licpnz.testingsystem.services;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import ru.licpnz.testingsystem.exceptions.NotFoundException;
import ru.licpnz.testingsystem.forms.SubmissionForm;
import ru.licpnz.testingsystem.models.Problem;
import ru.licpnz.testingsystem.models.Submission;
import ru.licpnz.testingsystem.models.SubmissionState;
import ru.licpnz.testingsystem.models.User;
import ru.licpnz.testingsystem.repositories.LanguageRepository;
import ru.licpnz.testingsystem.repositories.SubmissionRepository;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 28/11/2019
 * TestingServiceImpl
 *
 * @author havlong
 * @version 1.0
 */
@Service
public class TestingServiceImpl implements TestingService {

    private final LanguageRepository languageRepository;

    private final SubmissionRepository submissionRepository;

    public TestingServiceImpl(LanguageRepository languageRepository, SubmissionRepository submissionRepository) {
        this.languageRepository = languageRepository;
        this.submissionRepository = submissionRepository;
    }

    @Override
    public void test(SubmissionForm submissionForm, Problem problem, User user) {
        /*
        Date time = new Date();
        if (time.after(problem.getContest().getFinishTime()) || time.before(problem.getContest().getStartTime()))
            throw new NotFoundException();
        Submission submission = Submission.builder()
                .submissionTime(time)
                .language(languageRepository.findLanguageByName(submissionForm.getLanguageName()).orElseThrow(NotFoundException::new))
                .owner(user)
                .pathToProgram(user.getLogin() + " " + new SimpleDateFormat().format(time))
                .state(SubmissionState.Q)
                .problem(problem).build();
        submissionRepository.saveAndFlush(submission);
        File dir = new File(submission.getPathToProgram());
        dir.mkdir();
        File program = new File(dir, submission.getLanguage().getProgramName());
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(program))) {
            writer.write(submissionForm.getProgram());
        } catch (IOException ignored) {
        }
        if (submission.getLanguage().getCompilationCommand() != null) {
            try {
                Process p = Runtime.getRuntime().exec(submission.getLanguage().getCompilationCommand(), null, dir);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        File toExe = new File(dir, submission.getLanguage().getCompiledFileName());
        if (!toExe.exists()) {
            submission.setState(SubmissionState.CE);
            submissionRepository.saveAndFlush(submission);
            return;
        }
        submission.setState(SubmissionState.T);
        try {
            Process testing = Runtime.getRuntime().exec(submission.getLanguage().getCompilationCommand(), null, dir);
            if (!testing.waitFor(submission.getProblem().getTimeLimit(),TimeUnit.SECONDS)) {

            }
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
        */
        Date time = new Date();
        MultipartFile source = submissionForm.getProgram();
        /*if (time.after(problem.getContest().getFinishTime()) || time.before(problem.getContest().getStartTime()))
            throw new NotFoundException();*/
        SubmissionState state = SubmissionState.Q;
        File file = new File("/home/anton/Документы/submissions/" + user.getId() + "/");
        System.out.println(file.getAbsolutePath());
        if (!file.isDirectory())
            file.mkdir();
        System.out.println(file.exists());

        try {
            source.transferTo(file);
        } catch (IOException e) {

        }

        Submission submission = Submission.builder()
                .language(languageRepository.findLanguageByName(submissionForm.getLanguageName()).orElseThrow(NotFoundException::new))
                .owner(user)
                .problem(problem)
                .submissionTime(time)
                .state(state)
                .lastTest(1)
                .pathToProgram("/" + user.getLogin() + "/" + problem.getId() + "/" + new SimpleDateFormat().format(time))
                .build();


        submissionRepository.save(submission);


        //test

        //TODO make normal version with normal people
    }
}
