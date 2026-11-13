package tn.essat.restaurant.dao;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import tn.essat.restaurant.model.Plat;

public interface PlatRepository extends JpaRepository<Plat, Long> {
    List<Plat> findByDisponibleTrue();
}
