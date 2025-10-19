package iuh.fit.se.bai2.respositories;
import iuh.fit.se.bai2.entities.DienThoai;
import iuh.fit.se.bai2.entities.NhaCungCap;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DienThoaiRepository extends JpaRepository<DienThoai, Integer> {
    List<DienThoai> findByNhaCungCap(NhaCungCap nhaCungCap);
}
