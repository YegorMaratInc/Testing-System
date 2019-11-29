package ru.licpnz.testingsystem.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.licpnz.testingsystem.models.Contest;

import java.util.List;
import java.util.UUID;

/**
 * 28/11/2019
 * ContestRepository
 *
 * @author havlong
 * @version 1.0
 */
public interface ContestRepository extends JpaRepository<Contest, Long> {
}
