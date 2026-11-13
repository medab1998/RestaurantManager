package tn.essat.restaurant.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import tn.essat.restaurant.model.Client;

public interface ClientRepository extends JpaRepository<Client, Long> { }
