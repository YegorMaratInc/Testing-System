package ru.licpnz.testingsystem.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.licpnz.testingsystem.models.Problem;
import ru.licpnz.testingsystem.models.Submission;
import ru.licpnz.testingsystem.models.SubmissionState;
import ru.licpnz.testingsystem.models.User;

import java.util.List;
import java.util.Optional;

/**
 * 28/11/2019
 * SubmissionRepository
 *
 * @author havlong
 * @version 1.0
 */
public interface SubmissionRepository extends JpaRepository<Submission, Long> {
    List<Submission> findAllByOwnerAndProblemOrderBySubmissionTime(User owner, Problem problem);

    Optional<Submission> findFirstByOwnerOrderBySubmissionTimeDesc(User owner);

    List<Submission> findAllByOwner(User owner);

    List<Submission> findAllByState(SubmissionState state);
}
