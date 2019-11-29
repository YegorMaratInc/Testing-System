package ru.licpnz.testingsystem.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.licpnz.testingsystem.models.User;

import java.util.Optional;

/**
 * 28/11/2019
 * UserRepository
 *
 * @author havlong
 * @version 1.0
 */
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findUserByLogin(String login);
}
