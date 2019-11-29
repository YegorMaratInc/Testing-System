package ru.licpnz.testingsystem.security.details;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import ru.licpnz.testingsystem.models.User;
import ru.licpnz.testingsystem.models.UserState;

import java.util.Collection;
import java.util.Collections;

/**
 * 28/11/2019
 * UserDetailsImpl
 *
 * @author havlong
 * @version 1.0
 */
public class UserDetailsImpl implements UserDetails {

    private User user;

    public UserDetailsImpl(User user) {
        this.user = user;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        String userRole = user.getUserRole().name();
        SimpleGrantedAuthority authority = new SimpleGrantedAuthority(userRole);
        return Collections.singletonList(authority);
    }

    @Override
    public String getPassword() {
        return user.getHashPassword();
    }

    @Override
    public String getUsername() {
        return user.getLogin();
    }

    @Override
    public boolean isAccountNonExpired() {
        return !user.getUserState().equals(UserState.DELETED);
    }

    @Override
    public boolean isAccountNonLocked() {
        return !user.getUserState().equals(UserState.BANNED);
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return user.getUserState().equals(UserState.ACTIVE);
    }

    public User getUser() {
        return user;
    }
}
