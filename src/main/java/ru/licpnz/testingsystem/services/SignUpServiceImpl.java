package ru.licpnz.testingsystem.services;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import ru.licpnz.testingsystem.forms.UserForm;
import ru.licpnz.testingsystem.models.User;
import ru.licpnz.testingsystem.models.UserRole;
import ru.licpnz.testingsystem.models.UserState;
import ru.licpnz.testingsystem.repositories.UserRepository;

/**
 * 28/11/2019
 * SignUpServiceImpl
 *
 * @author havlong
 * @version 1.0
 */
@Service
public class SignUpServiceImpl implements SignUpService {

    private final UserRepository userRepository;

    private final PasswordEncoder passwordEncoder;

    public SignUpServiceImpl(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public void signUp(UserForm userForm) {
        String hashPassword = passwordEncoder.encode(userForm.getPassword());

        User user = User.builder()
                .firstName(userForm.getFirstName())
                .lastName(userForm.getLastName())
                .login(userForm.getLogin())
                .hashPassword(hashPassword)
                .userRole(UserRole.GHOST)
                .userState(UserState.ACTIVE)
                .build();

        userRepository.save(user);
    }
}
