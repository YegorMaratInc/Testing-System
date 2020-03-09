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


        Submission submission = Submission.builder()
                .language(languageRepository.findLanguageByName(submissionForm.getLanguageName()).orElseThrow(NotFoundException::new))
                .owner(user)
                .problem(problem)
                .submissionTime(time)
                .state(state)
                .lastTest(1)
                .pathToProgram("submissions" + File.separator + time.getTime())
                .build();

        File file = new File(System.getProperty("user.dir") + File.separator + "submissions" + File.separator + time.getTime() + File.separator + submission.getId());
        if (!file.isDirectory()) {
            if (!file.exists())
                if (!file.mkdirs())
                    System.out.println("No");
        }


        try {
            source.transferTo(new File(file.getAbsolutePath() + submission.getLanguage().getExtension()));
        } catch (IOException e) {
            System.out.println("No");
            System.out.println((file.getAbsolutePath() + submission.getLanguage().getExtension()));
        }


        submissionRepository.save(submission);
        Test testing = new Test();
        testing.setSubmission(submission);
        testing.setProblem(problem);
        testing.run();
        //test

        //TODO make normal version with normal people
    }

    static class Test implements Runnable {
        private Submission submission;
        private Problem problem;

        public void setProblem(Problem problem) {
            this.problem = problem;
        }

        public void setSubmission(Submission submission) {
            this.submission = submission;
        }

        @Override
        public void run() {
            /*File source = new File(submission.getPathToProgram() + File.separator + "null" + submission.getLanguage().getExtension());
            File inputDirectory = new File(problem.getId() + File.separator + "input");
            File outputDirectory = new File(problem.getId() + File.separator + "output");
            if (submission.getLanguage().getName().equals("GNU G++ 14")) {
                try {
                    Runtime.getRuntime().exec("g++ -Wall -o null " + source.getAbsolutePath());
                    Runtime.getRuntime().exec("./null < " + inputDirectory.getAbsolutePath() + File.separator + "i1.txt > output.txt");
                } catch (IOException e) {
                    System.out.println("Compile error");
                }
            }*/

        }
    }
}
