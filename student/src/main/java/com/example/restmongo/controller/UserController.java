
package com.example.restmongo.controller;

import com.example.restmongo.model.User;
import com.example.restmongo.repository.UserRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/users")
public class UserController {

    private final UserRepository repo;

    public UserController(UserRepository repo) {
        this.repo = repo;
    }

    @GetMapping
    public List<User> getAllUsers() {
        return repo.findAll();
    }

    @PostMapping
    public User createUser(@RequestBody User user) {
        return repo.save(user);
    }

    @PutMapping("/{id}")
    public User updateUser(@PathVariable String id, @RequestBody User updatedUser) {
        return repo.findById(id).map(u -> {
            u.setNom(updatedUser.getNom());
            u.setEmail(updatedUser.getEmail());
            return repo.save(u);
        }).orElseThrow(() -> new RuntimeException("User non trouvé"));
    }

    @DeleteMapping("/{id}")
    public void deleteUser(@PathVariable String id) {
        repo.deleteById(id);
    }
}
