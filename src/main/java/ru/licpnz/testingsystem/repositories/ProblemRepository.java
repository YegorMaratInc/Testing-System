package ru.licpnz.testingsystem.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.licpnz.testingsystem.models.Contest;
import ru.licpnz.testingsystem.models.Problem;

import java.util.List;
import java.util.Optional;

/**
 * 28/11/2019
 * ProblemRepository
 *
 * @author havlong
 * @version 1.0
 */
public interface ProblemRepository extends JpaRepository<Problem, Long> {
    List<Problem> findAllByContest(Contest contest);

    Optional<Problem> findByContestAndShortName(Contest contest, String shortName);
}
