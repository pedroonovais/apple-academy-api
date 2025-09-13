package br.senac.sp.appleacademyapi.security;

import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

public interface AuthUserRepository extends JpaRepository<AuthUser, UUID>  {

    Optional<AuthUser> findByEmail(String email);
    
}
